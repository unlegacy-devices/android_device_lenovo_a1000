#!/bin/sh

# vendorsetup.sh is sourced by build/envsetup.sh in the root of the Android build tree.
# Ensure that it is sourced from the root of the Android tree.

build_root=$(pwd)
echo "======================= Applying patches: enum ======================="
patches_path="$build_root/device/lenovo/a1000/patches/"

cd "$patches_path" || exit 1

echo "======================= Applying patches: start ======================="

for patch in $(find -type f -name '*.patch' -exec basename {} \; | sort); do
    absolute_patch_path="$patches_path/$patch"
    repo_to_patch="$(dirname "$patch" | tr '_' '/' | tr '+' '_')"

    echo -n "Is $repo_to_patch patched for '$patch' ?.. "
    cd "$build_root/$repo_to_patch" || exit 1

    if git log | fgrep -qm1 "$patch"; then
        echo -n Yes
        commit_hash=$(git log --oneline | fgrep -m1 "$patch" | cut -d ' ' -f 1)

        if [ -n "$commit_hash" ]; then
            commit_id=$(git format-patch -1 --stdout "$commit_hash" | git patch-id | cut -d ' ' -f 1)
            patch_id=$(git patch-id < "$absolute_patch_path" | cut -d ' ' -f 1)

            if [ "$commit_id" = "$patch_id" ]; then
                echo ', patch matches'
            else
                echo -n ', PATCH MISMATCH!'
                echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                sed '0,/^$/d' "$absolute_patch_path" | head -n -3  > /tmp/patch
                git show --stat "$commit_hash" -p --pretty=format:%b > /tmp/commit
                diff -u /tmp/patch /tmp/commit
                rm /tmp/patch /tmp/commit
                echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                echo ' Resetting branch!'
                # Uncomment the next two lines if you want to reset the branch and apply the patch again
                # git checkout "$commit_hash~1"
                # git am "$absolute_patch_path" || git am --abort
            fi
        else
            echo "Unable to get commit hash for '$patch'! Something went wrong!"
            sleep 20
        fi
    else
        echo No
        echo "Trying to apply patch $patch to '$repo_to_patch'"
        if ! git am "$absolute_patch_path"; then
            echo "!!!!!!!!!!!! Failed, aborting git am !!!!!!!!!!!!!!"
            git am --abort
        fi
    fi
done

echo "======================= Applying patches: finished ======================="

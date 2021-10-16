using Glob
using NIfTI


"""
    glob_mris(path, pattern)

Get a list of MRIs in the given path.

Arguments
----------
- `path::String`: Path where to look for pattern.
- `pattern::String`: Pattern to glob.

Returns
-------
- `mris::Vector{String}`: List of MRIs.

Example
_______

```julia-repl
julia> glob_mris("~/Datasets/", "**/tse.nii.gz")
1-element Vector{String}:
 "~/Datasets/sub-00C/tse.nii.gz"
```
"""
function glob_mris(path::String, pattern::String)::Vector{String}
    # todo: assert pattern compliant with nifti files
    path = expanduser(path)

    mris = glob(pattern, path)
    if (length(mris) == 0)
        error("No MRIs found in path: ", path)
    end

    return mris
end

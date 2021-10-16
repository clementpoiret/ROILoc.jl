using Glob
using NIfTI


"""
    load_mris(path, pattern)

Get a list of MRIs in the given path.

Arguments
----------
- `path::String`: Path where to look for pattern.
- `pattern::String`: Pattern to glob.

Returns
-------
- `mris::Vector{String}`: List of paths of MRIs.
- `loaded_mris::Vector{NIVolume}`: List of loaded MRIs.

Example
_______

```julia-repl
julia> paths, volumes = load_mris("~/Datasets/", "**/tse.nii.gz");
julia> paths
1-element Vector{String}:
 "/home/me/Datasets/sub-00C/tse.nii.gz"
julia> volumes
1-element Vector{NIVolume}:
 Float32[20.0 83.0 … 63.0 19.0; 10.0 59.0 …
```
"""
function load_mris(path::String,
                   pattern::String)::Tuple{Vector{String},Vector{NIVolume}}
    # todo: assert pattern compliant with nifti files
    path = expanduser(path)

    mris = glob(pattern, path)
    if (length(mris) == 0)
        error("No MRIs found in path: ", path)
    else
        loaded_mris = [niread(mri) for mri in mris]
        return mris, loaded_mris
    end
end

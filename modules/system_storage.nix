{config, pkgs, ...}:
{
  fileSystems."/D" = {
    device = "dev/disk/by-uuid/2079d76f-8017-4b7f-b9e7-6c39cdef3c5c";
    fsType = "ext4";
    options = [
      "users"
      "nofail"
    ];
  };
}

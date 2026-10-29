hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- WLR_NO_HARDWARE_CURSORS is ignored by hyprland now, this is the replacement
hl.config({ cursor = { no_hardware_cursors = true } })
-- hl.env("WLR_DRM_DEVICES", "/dev/dri/card0")

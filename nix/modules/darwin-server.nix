# Darwin (macOS/launchd) module for the hyuqueue-topic-rss-server service.
# Thin wrapper around the foundation's mkDarwinService helper.  See
# mkNixosService for the Linux/systemd equivalent.  Cross-platform
# declarations live in `./common.nix`, which is imported below so
# anything added there merges into both platform modules via the
# module-merge system.
#
# This file is the seam where nix-darwin-only declarations (e.g.
# launchd drop-ins, defaults.NSGlobalDomain entries) belong.  Adding
# to the `imports` list or declaring `config.launchd.…` here merges
# with the foundation-generated service module — no restructuring
# needed to introduce a platform-specific bit.
#
# Minimal usage (defaults to Unix domain socket):
#
#   inputs.hyuqueue-topic-rss.darwinModules.server
#
#   services.hyuqueue-topic-rss-server = {
#     enable = true;
#   };
#
# To use TCP instead:
#
#   services.hyuqueue-topic-rss-server = {
#     enable = true;
#     socket = null;
#     port   = 8080;
#   };
#
# To enable health checking (requires a reachable health endpoint):
#
#   services.hyuqueue-topic-rss-server = {
#     enable = true;
#     healthCheck.enable = true;
#     healthCheck.url = "http://127.0.0.1:3000/health";
#   };
{
  self,
  foundation,
}: {
  imports = [
    ./common.nix
    (foundation.lib.mkDarwinService {
      name = "hyuqueue-topic-rss-server";
      inherit self;
    })
  ];
}

#!/bin/bash
set -e

op inject -i mealie.yaml | podman compose -f - down
op inject -i cloudflare.yaml | podman compose -f - down

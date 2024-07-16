#!/bin/bash
set -e

 op inject -i cloudflare.yaml | podman compose -f - up -d

 op inject -i mealie.yaml | podman compose -f - build
 op inject -i mealie.yaml | podman compose -f - up -d

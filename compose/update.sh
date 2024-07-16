#!/bin/bash
set -e

 op inject -i mealie.yaml | podman compose -f - pull
 op inject -i mealie.yaml | podman compose -f - up -d
 op inject -i cloudflare.yaml | podman compose -f - pull
 op inject -i cloudflare.yaml | podman compose -f - up -d

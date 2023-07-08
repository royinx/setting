#!/bin/bash
docker container list --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}' | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}' | awk 'BEGIN{FS=OFS="[[:space:]][[:space:]]+"} gsub("0.0.0.0:", "", $7) gsub(",?:::[^,]+", "", $7) gsub(" , "," ",$7) sub(", $", "", $7) sub(".*/.*/", "", $3) sub("minutes","m",$4) sub("minutes","m",$5) sub("hours","h",$4) sub("hours","h",$5) sub("ago","",$4) {printf("%-15s%-22s%-25s%-13s%s\n",$1" ",$2" ",$3" ",$4" ",$5)}'
# docker container list --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}' | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}' | awk 'BEGIN{FS=OFS="[[:space:]][[:space:]]+"} gsub("0.0.0.0:", "", $7) gsub(",?:::[^,]+", "", $7) gsub(" , "," ",$7) sub(", $", "", $7) sub(".*/.*/", "", $3) sub("minutes","m",$4) sub("minutes","m",$5) sub("hours","h",$4) sub("hours","h",$5) sub("ago","",$4) {printf("%-15s%-22s%-38s%-16s%-22s%-21s%s\n",$1" ",$2" ",$3" ",$4" ",$5" ",$6" ",$7)}'
echo ""
# docker container list --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}' | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}' | awk 'BEGIN{FS=OFS="[[:space:]][[:space:]]+"} gsub("0.0.0.0:", "", $7) gsub(",?:::[^,]+", "", $7) gsub(" , "," ",$7) sub(", $", "", $7) sub(".*/.*/", "", $3) sub("minutes","m",$4) sub("minutes","m",$5) sub("hours","h",$4) sub("hours","h",$5) sub("ago","",$4) {printf("%-15s%-22s%-38s%-16s%-22s%-21s%s\n",$1" ",$2" ",$3" ",$4" ",$5" ",$6" ",$7)}'
# docker container list --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Networks}}\t{{.Ports}}' | awk 'NR<2{print $0;next}{print $0 | "sort --key=2"}'| awk 'BEGIN{FS=OFS="[[:space:]][[:space:]]+"} gsub("0.0.0.0:", "", $5) gsub(",?:::[^,]+", "", $5) gsub(" , "," ",$5) sub(", $", "", $5) sub(".*/.*/", "", $3) {printf("%-15s%-22s%-25s%-13s%s\n",$1" ",$2" ",$3" ",$4" ",$5)}'
# echo ""
docker container list --format 'table {{.Names}}\t{{.Networks}}\t{{.Ports}}' | awk 'NR<2{print $0;next}{print $0 | "sort --key=1"}'| awk 'BEGIN{FS=OFS="[[:space:]][[:space:]]+"} gsub("0.0.0.0:", "", $3) gsub(",?:::[^,]+", "", $3) gsub(" , "," ",$3) sub(", $", "", $3) {printf("%-15s%-22s%s\n",$2" ",$1" ",$3)}'
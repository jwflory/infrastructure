#!/bin/bash
# A script to backup all servers using duply
#

GREEN='\033[0;32m'
NC='\033[0m'
ORANGE='\033[0;33m'
RED='\033[0;31m'

echo -e "${ORANGE}Beginning backups...${NC}"

echo -e "${ORANGE}Backing up global plugin directory...${NC}"
duply plugindir backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${ORANGE}Backing up survival... (this could take a while)${NC}"
duply survival backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${ORANGE}Backing up lobby...${NC}"
duply lobby backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${ORANGE}Backing up creative...${NC}"
duply creative backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${ORANGE}Backing up space...${NC}"
duply space backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${ORANGE}Backing up development...${NC}"
duply development backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${ORANGE}Backing up RITcraft Survival...${NC}"
duply rit-survival backup
echo -e "${GREEN}Duply exited.${NC}"

echo -e "${GREEN}All done! Please double-check file integrity.${NC}"

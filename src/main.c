#include <fujinet-fuji.h>
#ifndef _CMOC_VERSION_
#include <stdio.h>
#include <string.h>
#endif /* _CMOC_VERSION_ */

AdapterConfigExtended ace;

void main()
{
  printf("Searching for FujiNet...\n");
  if (!fuji_get_adapter_config_extended(&ace))
    strcpy(ace.fn_version, "FAIL");

  printf("FujiNet: %-14s\n", ace.fn_version);

  /* Loop forever so message stays on screen */
  while (1)
    ;

  return;
}

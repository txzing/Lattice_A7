/*
 * tpg.h
 *
 *  Created on: Apr 30, 2021
 *      Author: andreas
 */

#ifndef __TPG_H__
#define __TPG_H__

#include "xparameters.h"
#ifdef XPAR_XV_TPG_NUM_INSTANCES

#include "xv_tpg.h"

void tpg_cfg(XV_tpg *InstancePtr, u32 height, u32 width, u32 colorFormat, u32 bckgndId);
void tpg_box(XV_tpg *InstancePtr, u32 boxSize, u32 motionSpeed);
void tpg_config(void);

#endif


#endif /* _TPG_H_ */

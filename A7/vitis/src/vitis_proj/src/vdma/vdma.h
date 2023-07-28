#ifndef __VDMA_H__
#define __VDMA_H__

#include "xparameters.h"
#ifdef XPAR_XAXIVDMA_NUM_INSTANCES

#include "xaxivdma.h"
#include "xil_cache.h"

u32 vdma_init(u16 DeviceID,XAxiVdma *Vdma);
int vdma_read_init(short DeviceID,short HoriSizeInput,short VertSizeInput,short Stride,unsigned int FrameStoreStartAddr);
int vdma_write_init(short DeviceID,short HoriSizeInput,short VertSizeInput,short Stride,unsigned int FrameStoreStartAddr);
u32 vdma_version();
void vdma_config(void);
void vdma_config_video_out(void);
void clear_display(void);
void clear_video_out_display(void);

#endif

#endif /* VDMA_H_ */

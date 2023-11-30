
// Sequence to make the circuit go from standby to zero
RX4.LDO_IF_CTL.LDO_LS_1V35_EN = 1; //	Enable overvoltage LDO 1us
// This can be group in a single regiter write
RX4.PWR_CTL.FAST_ENABLE = 1;      // Fast Enable
RX4.PWR_CTL.IBIAS_EN = 1;         //	enable Ibias
RX4.PWR_CTL.LO_LOX2_EN = 1;       //	Enable the lox2
RX4.PWR_CTL.LO_IQBI_EN = 1;       //	enable the iqbuffers
RX4.PWR_CTL.LO_IQBQ_EN = 1;       //	enable the iqbuffers
RX4.PWR_CTL.LO_LDI_EN = 1;        //	enable lo level detectors
RX4.PWR_CTL.LO_LDQ_EN = 1;        //	enable lo level detectors
RX4.PWR_CTL.LNA_EN = 1;           //	enable Lna
RX4.PWR_CTL.MIXER_EN = 1;         //	enable mixer 
RX4.PWR_CTL.SAT_DET_ST1_EN = 1;   //	enable saturation detector
RX4.PWR_CTL.SAT_DET_ST2_EN = 1;   //	enable saturation detector
sleep(5); 						  //    Wait 5us
RX4.PWR_CTL.FAST_ENABLE = 0;      // 	Disable fast enable
			
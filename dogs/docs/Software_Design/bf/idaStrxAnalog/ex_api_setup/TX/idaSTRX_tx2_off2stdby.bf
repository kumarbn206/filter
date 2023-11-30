

// Transmitter from off to Stanby mode, GLDO1 & GLDO2 enabled + GBIAS for LLDOs

TX2.PON.PON_TX_LS = 1;

TX2.PON.BP_FLT_LDO_LO = 1;

TX2.PON.BP_FLT_LDO_PR = 1;

TX2.PON.PON_LDO_LO = 1;

TX2.PON.PON_LDO_PR = 1;

sleep(30);

TX2.PON.BP_FLT_LDO_LO = 0;  // LLDO takes ~ 30us to settle

TX2.PON.BP_FLT_LDO_PR = 0;  // LLDO takes ~ 30us to settle

TX2.TXDIG_DFT.CLK_FREE_RUN = 1;  // Enable the clock locally instead from TE (later in API it will move to power management)



// ISM FIT TEST Status register read

sleep_bv(ISM.ISM_FIT_TEST_REG_STATUS.ISM_TEST_COMPLETE,0x1);
sleep_bv(ISM.ISM_FIT_TEST_REG_STATUS.FIT_STATUS_RTM_0,0x1);
sleep_bv(ISM.ISM_FIT_TEST_REG_STATUS.FIT_STATUS_RTM_1,0x1);


/*******************************************************************************
 *
 * <COPYRIGHT_TAG>
 *
 *******************************************************************************/

/**
 * @brief Doxygen File Introduction Chapter
 * @file doxygen_introduction.c
 * @author Intel Corporation
 **/


/**
 * @page ref_introduction Introduction
 * <DIV style="text-align:justify;">
 *
 * <B style="font-size:15px;"><I>Notices & Disclaimers</I></B><BR/><BR/> 
 * - Software and workloads used in performance tests may have been optimized for performance only on Intel microprocessors.
 * - Performance tests, such as SYSmark* and MobileMark*, are measured using specific computer systems, components, software, operations, and functions. Any change to any of those factors may cause the results to vary. You should consult other information and performance tests to assist you in fully evaluating your contemplated purchases, including the performance of that product when combined with other products. For more complete information, visit <a href="http://www.intel.com/benchmarks"><B style="color:blue;">www.intel.com/benchmarks</B></a>.
 * - Performance results are based on testing as of dates shown in configurations and may not reflect all publicly available updates. See backup for configuration details. No product or component can be absolutely secure.
 * - See backup for configuration details. For more complete information about performance and benchmark results, visit <a href="http://www.intel.com/benchmarks"><B style="color:blue;">www.intel.com/benchmarks</B></a>.
 * - Currently characterized errata are available on request
 * - Your costs and results may vary
 * - Intel Technologies may require enabled hardware, software, or service activation.
 * - Code names are used by Intel to identify products, technologies, or services that are in development and not publicly available.  These are not "commercial" names and not intended to function as trademarks.
 * - Intel, the Intel logo, and other Intel marks are trademarks of Intel Corporation or its subsidiaries. Other names and brands may be claimed as the property of others.
 * <BR/><BR/>
 * © Intel Corporation.
 * <BR/><BR/><BR/>
 *
 * <B style="font-size:15px;"><I>Legal disclaimer</I></B><BR/><BR/>
 * - You may not use or facilitate the use of this document in connection with any infringement or other legal analysis concerning Intel products described herein. You agree to grant Intel a non-exclusive, royalty-free license to any patent claim thereafter drafted which includes subject matter disclosed herein.
 * - No license (express or implied, by estoppel or otherwise) to any intellectual property rights is granted by this document.
 * - All information provided here is subject to change without notice. Contact your Intel representative to obtain the latest Intel product specifications and roadmaps.
 * - The products described may contain design defects or errors known as errata which may cause the product to deviate from published specifications. Current characterized errata are available on request.
 * - Copies of documents which have an order number and are referenced in this document may be obtained by calling 1-800-548-4725 or by visiting: <a href="http://www.intel.com/design/literature.htm"><B style="color:blue;">http://www.intel.com/design/literature.htm</B></a>
 * - Intel technologies features and benefits depend on system configuration and may require enabled hardware, software or service activation. Learn more at <a href="http://www.intel.com/"><B style="color:blue;">http://www.intel.com/</B></a> or from the OEM or retailer.
 * - No computer system can be absolutely secure.
 * - Intel and the Intel logo are trademarks of Intel Corporation in the U.S. and/or other countries.
 * - Other names and brands may be claimed as the property of others.
 * - Intel provides these materials as-is, with no express or implied warranties.
 * - All products, dates, and figures specified are preliminary based on current expectations, and are subject to change without notice.
 * - Performance results are based on testing as of 1st August 2020 and may not reflect all publicly available security updates. See configuration disclosure for details. No component or product can be absolutely secure.
 * - Intel products may contain design defects or errors known as errata which may cause the product to deviate from published specifications. Current characterized errata are available on request.
 * - Intel may make changes to dates, specifications, product descriptions, and plans referenced in this document at any time, without notice. 
 * - Wireless connectivity and some features may require you to purchase additional software, services or external hardware. 
 * - Performance tests and ratings are measured using specific computer systems and/or components and reflect the approximate performance of Intel products as measured by those tests. Any difference in system hardware or software design or configuration may affect actual performance. Buyers should consult other sources of information to evaluate the performance of systems or components they are considering purchasing. For more information on performance tests and on the performance of Intel products, visit Intel Performance Benchmark Limitations 
 * - Software and workloads used in performance tests may have been optimized for performance only on Intel microprocessors.  Performance tests, such as SYSmark and MobileMark, are measured using specific computer systems, components, software, operations and functions.  Any change to any of those factors may cause the results to vary.  You should consult other information and performance tests to assist you in fully evaluating your contemplated purchases, including the performance of that product when combined with other products. 
 * - Intel technologies’ features and benefits depend on system configuration and may require enabled hardware, software or service activation. Performance varies depending on system configuration. No component or product can be absolutely secure. Check with your system manufacturer or retailer or learn more at <a href="http://www.intel.com/"><B style="color:blue;">http://www.intel.com/</B></a>.
 * - Some results have been estimated or simulated using internal Intel analysis or architecture simulation or modeling and provided to you for informational purposes. Any differences in your system hardware, software or configuration may affect your actual performance.  
 * - Intel, the Intel logo are trademarks or registered trademarks of Intel Corporation or its subsidiaries in the United States and other countries.
 * - Other names and brands may be claimed as the property of others.
 * <BR/><BR/>
 * Copyright © 2020 Intel Corporation. All rights reserved.
 * <BR/><BR/><BR/>
 *
 * <B style="font-size:15px;"><I>Optimization Notice</I></B><BR/><BR/>
 * Intel’s compilers may or may not optimize to the same degree for non-Intel microprocessors for optimizations that are not unique to Intel microprocessors. These optimizations include SSE2, SSE3, and SSSE3 instruction sets and other optimizations. Intel does not guarantee the availability, functionality, or effectiveness of any optimization on microprocessors not manufactured by Intel. Microprocessor-dependent optimizations in this product are intended for use with Intel microprocessors. Certain optimizations not specific to Intel microarchitecture are reserved for Intel microprocessors. Please refer to the applicable product User and Reference Guides for more information regarding the specific instruction sets covered by this notice. <B>Notice revision #20110804</B>
 * <BR/><BR/><BR/>
 *
 * <B style="font-size:15px;"><I>Product Status</I></B><BR/><BR/>
 * <I>Note: This product is still under development. For the current implementation status compared
 * to the Product Definition below, see the Release Notes. As of this release, the software has implemented
 * up to Release 15 of the 3GPP standard and includes various L1 functions from this release.</I>
 * <BR/><BR/><BR/>
 *
 * <B style="font-size:15px;"><I>Product Definition</I></B><BR/><BR/>
 * The Intel 5GNR Reference PHY is a baseband PHY Reference Design for a 4G and 5G base station, using
 * Xeon&reg; series Processor with Intel Architecture. This 5GNR Reference PHY consists of a library of c-callable functions
 * which are validated on an Intel&reg; Xeon&reg; Broadwell / SkyLake / CascadeLake / IceLake platforms and demonstrates the capabilities of the software running different
 * 5GNR L1 features.
 * Functionality of these library functions is defined by the relevant sections in [3GPP TS 38.211, 212, 213, 214 and 215].
 * Performance of the Intel 5GNR Reference PHY meets the requirements defined by the base station conformance tests
 * in [3GPP TS 38.141]. This library of Intel functions will be used by Intel Partners and end-customers as a foundation
 * for their own product development.
 * <BR/><BR/>
 *
 *
 * </DIV>
 */


/**
 * @page ref_executive_summary Executive Performance and Release Updates
 * <DIV style="text-align:justify;">
 *
* Here are some of the highlights in the FlexRAN 22.11 release:
 *    - <B>SDK updates</B>:
 *        - SDK function refactoring:
 *           - Lot of the SDK modules (PUCCH, PUSCH, SRS, Beam weight generation, PRACH) were re-written using C++ templates and OneAPI DVEC library
 *           - This reduces overall size of the code and provides easy mechanism to switch between int16 and fp16 implementations (based on target processor support)
 *           - This change along with the OneAPI tool chain shows slight cycle count performance improvement (1-5%) on many modules.
 *        - SDK for LLR compression/packing prior to FEC offload
 *        - Implement 3/6 tone PUSCH IDFT and demapper for NBIOT
 *        - Packing 8bits LLR into 6bits to reduce PCIe transport bandwidth
 *        - SRS DL BF weight Normalization
 *        - SRS channel enhancement - Remove DFT size limitation in Sub band SRS CE
 *        - SRS enhancement for Dynamic Beam Forming
 *        - PDSCH / PUSCH DFT based Beamforming feature implemented as SDK modules. (Not integrated or tested in pipeline)
 *    - <B>SPR-SP enabling</B>:
 *        - FlexRAN pipeline can now run on SPR platform with AVX512 and AVX512_FP16 implementation (chosen from phycfg.xml)
 *        - Validation is preliminary with pre-PRQ samples run on pre-production platform.
 *    - <B>XRAN / O-RAN enhancements</B>
 *        - SSB Beam management
 *        - Support 32T/R 100Mhz Downlink Dynamic beamforming C/U message with MTU size
 *        - 8T8R XRAN Mode Testing
 *        - Front haul core optimization - move DL packet header creation into L1 BBU cores
 *        - GPS sync verification and SyncE verification using WestPort Channel NIC
 *        - Dynamic Section with packet segment Enhancement for Dynamic Beamforming support (early changes)
 *        - Configurable Bit Range of eAxC ID in eCPRI header, configurable the mapping between Channel Type with RU_PORT_ID
 *        - NBIOT ORAN support
 *        - O-RAN FH + PHY: C/U Plane Support for Ext 1, Tested & Profiled (64T64R)
 *        - O-RAN FH: Mixed Numerology (Section Type 3) support
 *        - ORAN support for LTE pipeline (limited testing) and enhancements for Extension type 11 (CAT-B radios)
 *    - <B>BBUPool Scheduler enhancements</B>
 *        - BBU Pooling NUMA Node support
 *        - BBU Pooling Centralized scheduler feature (chosen at runtime from API)
 *        - Power saving enhancement APIs
 *        - Internal logic optimizations to reduce scheduling overhead - 0.5% - 1% per task
 *        - Older BBUPool scheduler will be obsolete from 22.06 release.
 *    - <B>Pipeline enhancements</B>
 *        - Support SRS Management - Delete obsolete UEs from L1 pool
 *        - Add SRS ping buffer management to maintain UE history and support 4 SRS ports per UE for longer duration
 *        - Support for 60MHz TDD (30kHz)
 *        - New 8T8R test configuration
 *           - 8x8 PDSCH beamforming support in pipeline for CAT-A radios.
 *        - Add UL L1 measurement Signal Power and Noise Power report to L2
 *        - DL Enhancement - support up to more than 4 port CSI-RS in Massive MIMO configuration
 *        - Support up to 16 ports CSI-RS
 *        - PDSCH enhancement, support 3 Layer configuration for single UE
 *        - PDSCH enhancement, support Dual DMRS
 *        - MCS for retransmission (29,30,31) support
 *        - L1-L2 API trace streaming and tool development (early changes, configured through xml, need dedicated core for streaming)
 *        - 32x32 Massive MIMO pipeline feature enhancements and fixes based on integration activities
 *        - Testmac enhancements to take real world L1 scheduling information and play with L1App (for cycle count and power benchmarking)
 *        - FEC nTBSlbrm support (retransmit only failed code blocks)
 *        - PUSCH / PUCCH signal power noise calculation
 *        - Bug fixes for UCI on PUSCH
 *    - <B>5GNR test vector generation tool</B>
 *        - PDCCH channel support 1DCI and one symbol scenario.
 *        - PUCCH channel support format 0 and format 2.
 *        - PUSCH can support to maximum 4 layer
 *        - PDSCH can support to maximum 4 layer
 *        - PRACH support
 *    - <B>Others</B>:
 *       - <B>Intel One API</B>: Entire FlexRAN has been tested only with OneAPI tool chain. Support for older ICC toolchain will be discontinued from 22.06 release
 *       - DPDK 21.11 migration
 *       - DPDK BBDEV FFT (for future hardware devices)
 *
 * <BR/>
 *
 * @section ref_cycle_performance Cycle Count Performance
 *
 * Beta Quality criteria for KPI (Key Performance Indicator)/Performance:
 *    - All KPI's tested with each scenario must have less than 15% deviation from target
 *    - There were no specific Cycle Count Performance Optimization tasks for this release.
 *        - KPI was to maintain Cycle Count Performance and BBU Core Utilization when compared with previous FlexRAN 22.07 Release.
 *        - All Cycle Count Performance Scenarios improved with the exception of the mmWave scenario which degraded 1 to 3%.
 *        - This falls within the limits of the 15% deviation to satisfy for Beta Quality.
 *        - <b>Beta Quality criteria for Cycle Count Performance and BBU Core Utilization was achieved.</b>
 *
 * All benchmarking tests now have advanced receiver enabled for PUCCH and PUSCH.
 * Here are some of the high level changes that were made which impacted the cycle count performance:
 *    - <B>1.</B> SDK refactoring using C++ templates and DVEC + One API Toolchain <I>(~1-5% improvement)</I>
 *    - <B>2.</B> PUSCH Channel Estimation optimization <I>(~10-15% improvement)</I>
 *    - <B>3.</B> SRS Channel Estimation algorithm improvement <I>(No change in cycles)</I>
 *
 * Because of these changes, the cycle count performance changes (compared to 22.07 release) across various different use cases are as below:
 * <BR/><BR/>
 * <B>Table shows Cycle count change (sum of cycles for all blocks) and BBU core utilization change (avg utilization on all BBU cores allocated)</B>
 * <BR/><BR/>
 *
 * <TABLE cellspacing = "0" cellpadding = "2" border = "0" class = "mrcTableBorderClass">
 * <TR>
 *   <TH class="mrc_platform_head_small" rowspan="3">Use Case</TH>
 *   <TH class="mrcll_platform_head_small" rowspan="3">Num Cells</TH>
 *   <TH class="mrc_platform_head_small" rowspan="3">Hardware<BR/>Accelerator</TH>
 *   <TH class="mrc_platform_head_small" colspan="6">Pipeline<BR/>Performance<BR/>Change v/s 22.07</TH>
 *   <TH class="mrc_platform_head_small" rowspan="3">Optimization</TH>
 *   <TH class="mrc_platform_head_small" rowspan="3">Pass/Fail</TH>
 * </TR>
 * <TR>
 *   <TH class="mrc_platform_head_small" colspan="3">CLX-SP</TH>
 *   <TH class="mrc_platform_head_small" colspan="3">ICX-SP</TH>
 * </TR>
 * <TR>
 *   <TH class="mrc_platform_head_small">Num BBU<BR/>Cores (HT)</TH>
 *   <TH class="mrc_platform_head_small">Cycle Count<BR/>Change</TH>
 *   <TH class="mrc_platform_head_small">BBU Core<BR/>Util Change</TH>
 *   <TH class="mrc_platform_head_small">Num BBU<BR/>Cores (HT)</TH>
 *   <TH class="mrc_platform_head_small">Cycle Count<BR/>Change</TH>
 *   <TH class="mrc_platform_head_small">BBU Core<BR/>Util Change</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">Sub3 10Mhz 4x4 (1ms TTI)</TH>
 *   <TH class="mrcll_platform">18</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">12</TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1-2% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1% improved</B></TH>
 *   <TH class="mrc_platform">8</TH>
 *   <TH class="mrc_platform"><B>No Change</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">~1% improved</B></TH>
 *   <TH class="mrc_platform">Optimizations 1</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">Sub3 20Mhz 4x4 (1ms TTI)</TH>
 *   <TH class="mrcll_platform">12</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">16</TH>
 *   <TH class="mrc_platform"><B style="color:green;">2-7% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1-3% improved</B></TH>
 *   <TH class="mrc_platform">12</TH>
 *   <TH class="mrc_platform"><B style="color:green;">1-5% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1-4% improved</B></TH>
 *   <TH class="mrc_platform">Optimizations 1, 2</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">Sub6 100Mhz 4x4 (0.5ms TTI)</TH>
 *   <TH class="mrcll_platform">4</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">13</TH>
 *   <TH class="mrc_platform"><B style="color:green;">2-7% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1% improved</B></TH>
 *   <TH class="mrc_platform">11</TH>
 *   <TH class="mrc_platform"><B style="color:green;">9-13% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1-3% improved</B></TH>
 *   <TH class="mrc_platform">Optimizations 1, 2</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">Massive MIMO 100Mhz 32x32 (0.5ms TTI)</TH>
 *   <TH class="mrcll_platform">3</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">18</TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">3-4% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">3% improved</B></TH>
 *   <TH class="mrc_platform">12</TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">2-5% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1% improved</B></TH>
 *   <TH class="mrc_platform">Optimizations 1, 2, 3</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">Massive MIMO 100Mhz 64x64 8 Stream (0.5ms TTI)</TH>
 *   <TH class="mrcll_platform">3</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">16</TH>
 *   <TH class="mrc_platform"><B style="color:green;">6-7% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1-3% improved</B></TH>
 *   <TH class="mrc_platform">14</TH>
 *   <TH class="mrc_platform"><B style="color:green;">6-10% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:lightgreen;">1-3% improved</B></TH>
 *   <TH class="mrc_platform">Optimizations 1, 2, 3</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">Massive MIMO 100Mhz 64x64 16 Stream (0.5ms TTI)</TH>
 *   <TH class="mrcll_platform">3</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">N/A</TH>
 *   <TH class="mrc_platform">N/A</TH>
 *   <TH class="mrc_platform">N/A</TH>
 *   <TH class="mrc_platform">20</TH>
 *   <TH class="mrc_platform"><B style="color:green;">7-8% improved</B></TH>
 *   <TH class="mrc_platform"><B style="color:green;">3-5% improved</B></TH>
 *   <TH class="mrc_platform">Optimizations 1, 2, 3</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * <TR>
 *   <TH class="mrcl_platform">MMWAVE 100Mhz 2x2 (0.125ms TTI)</TH>
 *   <TH class="mrcll_platform">4</TH>
 *   <TH class="mrc_platform">ACC100</TH>
 *   <TH class="mrc_platform">8</TH>
 *   <TH class="mrc_platform"><B style="color:orange;">~1-3% worse</B></TH>
 *   <TH class="mrc_platform"><B style="color:orange;">~1% worse</B></TH>
 *   <TH class="mrc_platform">8</TH>
 *   <TH class="mrc_platform"><B style="color:orange;">~1-3% worse</B></TH>
 *   <TH class="mrc_platform"><B style="color:orange;">~1% worse</B></TH>
 *   <TH class="mrc_platform">None</TH>
 *   <TH class="mrc_platform">Pass</TH>
 * </TR>
 * </TABLE>
 *
 * <BR/>
 *
 * <BR/><BR/>
 *
 * @section ref_wireless_performance Wireless Performance
 *
 * Beta Quality criteria for KPI (Key Performance Indicator)/Performance:
 *    - All KPI's tested with each scenario must have less than 15% deviation from target
 *    - There were no specific Uplink Wireless Performance for PUSCH/PUCCH or PRACH for this release.
 *        - KPI was to maintain Uplink Wireless Performance when compared with previous FlexRAN 22.07 Release.
 *        - Uplink Wireless Performance results for all test scenarios were maintained.
 *            - Please refer to Section 8: Wireless Performance Data
 *              - @ref ref_wireless_pusch_clxsp_n3000
 *              - @ref ref_wireless_pusch_clxsp_acc100
 *              - @ref ref_wireless_pusch_clxsp_soft_ldpc
 *              - @ref ref_wireless_pusch_icxsp_soft_ldpc
 *              - @ref ref_wireless_pucch_clxsp
 *              - @ref ref_wireless_pucch_icxsp
 *              - @ref ref_wireless_prach_clxsp
 *              - @ref ref_wireless_prach_icxsp
 *        - <b>Beta Quality criteria for Uplink Wireless Performance was achieved.</b>
 *
 * We run all the 3GPP required <B>wireless performance tests as defined in 38.104 Chapter 8</B> to test our UL receiver.
 * These tests are run with a software simulation of the channel models and not done with a real UE / radio equipment. <BR/><BR/>
 * <B>The Wireless Performance for PUSCH, PUCCH and PRACH are the same as previous 22.07 release.</B>
 * 
 * <BR/><BR/>
 *
 * The wireless performance improvement for PUSCH by enabling the advanced receiver algorithm is shown in graphs below. 
 *
 * \htmlonly
 *
 * <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 * <script type="text/javascript">
 *  google.charts.load("current", {packages:["corechart"]});
 *  google.charts.setOnLoadCallback(drawChart);
 *  function drawChart() {
 *    var options = {
 *        hAxis: { title: 'SNR (dB)', gridlines: {color: '#ccc', count: 35}, minValue: -15, maxValue: 20, format: '####' },
 *        vAxis: { title: 'Throughput (%)', gridlines: {color: '#ccc', count: 10}, },
 *        curveType: 'function',
 *        legend: { position: 'bottom' },
 *        chartArea: {width: '90%', height: '65%'},
 *        pointSize: 3
 *    };
 *    var data0 = google.visualization.arrayToDataTable([
 *        ['SNR', '1x4 TDLB Def', '1x4 TDLB Adv', '2x2 TDLB Def', '2x2 TDLB Adv', '2x2 TDLC Def', '2x2 TDLC Adv', '2x4 TDLB Def', '2x4 TDLB Adv', '2x4 TDLC Def', '2x4 TDLC Adv'],
 *        [-11,    44.3, 48.7,     null, null,     null, null,     null, null,     null, null],
 *        [-10,    54.1, 59.8,     null, null,     null, null,     null, null,     null, null],
 *        [-9,     67.1, 75.2,     null, null,     null, null,     null, null,     null, null],
 *        [-8,     83.6, 89.3,     null, null,     null, null,     null, null,     null, null],
 *        [-7,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [-6,     null, null,     null, null,     null, null,     47.2, 51.6,     null, null],
 *        [-5,     null, null,     null, null,     null, null,     55.0, 60.4,     null, null],
 *        [-4,     null, null,     null, null,     null, null,     67.3, 79.4,     null, null],
 *        [-3,     null, null,     null, null,     null, null,     83.3, 96.1,     null, null],
 *        [-2,     null, null,     48.2, 53.1,     null, null,     null, null,     null, null],
 *        [-1,     null, null,     55.7, 61.2,     null, null,     null, null,     null, null],
 *        [0,      null, null,     63.4, 71.7,     null, null,     null, null,     null, null],
 *        [1,      null, null,     72.9, 85.3,     null, null,     null, null,     null, null],
 *        [2,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [3,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [4,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [5,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [6,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [7,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [8,      null, null,     null, null,     null, null,     null, null,     57.0, 60.9],
 *        [9,      null, null,     null, null,     null, null,     null, null,     65.6, 75.2],
 *        [10,     null, null,     null, null,     null, null,     null, null,     77.3, 88.7],
 *        [11,     null, null,     null, null,     null, null,     null, null,     86.7, 97.0],
 *        [12,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [13,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [14,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [15,     null, null,     null, null,     57.4, 61.1,     null, null,     null, null],
 *        [16,     null, null,     null, null,     62.4, 68.2,     null, null,     null, null],
 *        [17,     null, null,     null, null,     67.0, 76.1,     null, null,     null, null],
 *        [18,     null, null,     null, null,     72.5, 83.3,     null, null,     null, null],
 *        [19,     null, null,     null, null,     null, null,     null, null,     null, null],
 *    ]);
 *
 *    var data1 = google.visualization.arrayToDataTable([
 *        ['SNR', '1x4 TDLB Def', '1x4 TDLB Adv', '2x2 TDLB Def', '2x2 TDLB Adv', '2x2 TDLC Def', '2x2 TDLC Adv', '2x4 TDLB Def', '2x4 TDLB Adv', '2x4 TDLC Def', '2x4 TDLC Adv'],
 *        [-11,    47.6, 51.4,     null, null,     null, null,     null, null,     null, null],
 *        [-10,    55.5, 64.5,     null, null,     null, null,     null, null,     null, null],
 *        [-9,     75.6, 87.0,     null, null,     null, null,     null, null,     null, null],
 *        [-8,     94.6, 95.5,     null, null,     null, null,     null, null,     null, null],
 *        [-7,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [-6,     null, null,     null, null,     null, null,     55.1, 57.7,     null, null],
 *        [-5,     null, null,     null, null,     null, null,     67.1, 74.5,     null, null],
 *        [-4,     null, null,     null, null,     null, null,     83.8, 91.3,     null, null],
 *        [-3,     null, null,     null, null,     null, null,     96.5, 98.7,     null, null],
 *        [-2,     null, null,     50.1, 50.4,     null, null,     null, null,     null, null],
 *        [-1,     null, null,     57.3, 59.5,     null, null,     null, null,     null, null],
 *        [0,      null, null,     74.4, 81.5,     null, null,     null, null,     null, null],
 *        [1,      null, null,     92.1, 97.9,     null, null,     null, null,     null, null],
 *        [2,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [3,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [4,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [5,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [6,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [7,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [8,      null, null,     null, null,     null, null,     null, null,     59.5, 66.1],
 *        [9,      null, null,     null, null,     null, null,     null, null,     66.3, 77.1],
 *        [10,     null, null,     null, null,     null, null,     null, null,     74.9, 88.0],
 *        [11,     null, null,     null, null,     null, null,     null, null,     84.0, 95.1],
 *        [12,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [13,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [14,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [15,     null, null,     null, null,     59.5, 66.1,     null, null,     null, null],
 *        [16,     null, null,     null, null,     65.3, 77.1,     null, null,     null, null],
 *        [17,     null, null,     null, null,     74.9, 88.0,     null, null,     null, null],
 *        [18,     null, null,     null, null,     84.0, 95.1,     null, null,     null, null],
 *        [19,     null, null,     null, null,     null, null,     null, null,     null, null],
 *    ]);
 *
 *    var data2 = google.visualization.arrayToDataTable([
 *        ['SNR', '1x4 TDLB Def', '1x4 TDLB Adv', '2x2 TDLB Def', '2x2 TDLB Adv', '2x2 TDLC Def', '2x2 TDLC Adv', '2x4 TDLB Def', '2x4 TDLB Adv', '2x4 TDLC Def', '2x4 TDLC Adv'],
 *        [-11,    null, null,     null, null,     null, null,     null, null,     null, null],
 *        [-10,    null, null,     null, null,     null, null,     null, null,     null, null],
 *        [-9,     39.0, 47.4,     null, null,     null, null,     null, null,     null, null],
 *        [-8,     49.3, 58.1,     null, null,     null, null,     null, null,     null, null],
 *        [-7,     59.9, 71.3,     null, null,     null, null,     null, null,     null, null],
 *        [-6,     74.3, 87.3,     null, null,     null, null,     null, null,     null, null],
 *        [-5,     null, null,     null, null,     null, null,     38.8, 50.4,     null, null],
 *        [-4,     null, null,     null, null,     null, null,     46.7, 57.9,     null, null],
 *        [-3,     null, null,     null, null,     null, null,     53.9, 74.5,     null, null],
 *        [-2,     null, null,     35.9, 49.4,     null, null,     65.4, 93.5,     null, null],
 *        [-1,     null, null,     42.5, 56.4,     null, null,     null, null,     null, null],
 *        [0,      null, null,     49.7, 65.0,     null, null,     null, null,     null, null],
 *        [1,      null, null,     56.4, 76.3,     null, null,     null, null,     null, null],
 *        [2,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [3,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [4,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [5,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [6,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [7,      null, null,     null, null,     null, null,     null, null,     null, null],
 *        [8,      null, null,     null, null,     null, null,     null, null,     57.0, 60.9],
 *        [9,      null, null,     null, null,     null, null,     null, null,     65.6, 75.2],
 *        [10,     null, null,     null, null,     null, null,     null, null,     77.3, 88.7],
 *        [11,     null, null,     null, null,     null, null,     null, null,     86.7, 97.0],
 *        [12,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [13,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [14,     null, null,     null, null,     null, null,     null, null,     null, null],
 *        [15,     null, null,     null, null,     52.8, 61.9,     null, null,     null, null],
 *        [16,     null, null,     null, null,     54.7, 69.9,     null, null,     null, null],
 *        [17,     null, null,     null, null,     56.2, 77.8,     null, null,     null, null],
 *        [18,     null, null,     null, null,     57.9, 85.7,     null, null,     null, null],
 *        [19,     null, null,     null, null,     null, null,     null, null,     null, null],
 *    ]);
 *
 *    var data3 = google.visualization.arrayToDataTable([
 *        ['SNR', '1x4 TDLB Def', '1x4 TDLB Adv', '2x2 TDLB Def', '2x2 TDLB Adv', '2x2 TDLC Def', '2x2 TDLC Adv', '2x4 TDLB Def', '2x4 TDLB Adv'],
 *        [-11,    null, null,     null, null,     null, null,     null, null],
 *        [-10,    null, null,     null, null,     null, null,     null, null],
 *        [-9,     46.1, 50.7,     null, null,     null, null,     null, null],
 *        [-8,     54.9, 62.7,     null, null,     null, null,     null, null],
 *        [-7,     72.0, 85.2,     null, null,     null, null,     null, null],
 *        [-6,     92.3, 98.3,     null, null,     null, null,     null, null],
 *        [-5,     null, null,     null, null,     null, null,     44.3, 47.2],
 *        [-4,     null, null,     null, null,     null, null,     51.5, 54.0],
 *        [-3,     null, null,     null, null,     null, null,     65.1, 74.5],
 *        [-2,     null, null,     49.2, 51.1,     null, null,     85.5, 95.9],
 *        [-1,     null, null,     54.7, 60.7,     null, null,     null, null],
 *        [0,      null, null,     67.6, 82.8,     null, null,     null, null],
 *        [1,      null, null,     82.9, 98.7,     null, null,     null, null],
 *        [2,      null, null,     null, null,     null, null,     null, null],
 *        [3,      null, null,     null, null,     null, null,     null, null],
 *        [4,      null, null,     null, null,     null, null,     null, null],
 *        [5,      null, null,     null, null,     null, null,     null, null],
 *        [6,      null, null,     null, null,     null, null,     null, null],
 *        [7,      null, null,     null, null,     null, null,     null, null],
 *        [8,      null, null,     null, null,     null, null,     null, null],
 *        [9,      null, null,     null, null,     null, null,     null, null],
 *        [10,     null, null,     null, null,     null, null,     null, null],
 *        [11,     null, null,     null, null,     null, null,     null, null],
 *        [12,     null, null,     null, null,     null, null,     null, null],
 *        [13,     null, null,     null, null,     null, null,     null, null],
 *        [14,     null, null,     null, null,     null, null,     null, null],
 *        [15,     null, null,     null, null,     55.7, 66.2,     null, null],
 *        [16,     null, null,     null, null,     61.3, 77.7,     null, null],
 *        [17,     null, null,     null, null,     67.0, 87.8,     null, null],
 *        [18,     null, null,     null, null,     74.1, 95.0,     null, null],
 *        [19,     null, null,     null, null,     null, null,     null, null],
 *    ]);
 *
 *    var chart0 = new google.visualization.LineChart(document.getElementById('linechart0'));
 *    chart0.draw(data0, options);
 *    var chart1 = new google.visualization.LineChart(document.getElementById('linechart1'));
 *    chart1.draw(data1, options);
 *    var chart2 = new google.visualization.LineChart(document.getElementById('linechart2'));
 *    chart2.draw(data2, options);
 *    var chart3 = new google.visualization.LineChart(document.getElementById('linechart3'));
 *    chart3.draw(data3, options);
 *  }
 * </script>
 * 
 * 
 * <BR/><BR/>
 * <TABLE cellspacing = "0" cellpadding = "2" border = "0">
 * <TR><TD style="text-align:center; font-size: 20px;"><B>Mu0 20Mhz Type A PUSCH</B></TD></TR>
 * <TR><TD><div id="linechart0" style="width: 1200px; height: 300px;"></div></TD></TR>
 * <TR><TD style="text-align:center; font-size: 20px;"><B><BR/><BR/>Mu0 20Mhz Type B PUSCH</B></TD></TR>
 * <TR><TD><div id="linechart2" style="width: 1200px; height: 300px;"></div></TD></TR>
 * <TR><TD style="text-align:center; font-size: 20px;"><B><BR/><BR/>Mu1 100Mhz Type A PUSCH</B></TD></TR>
 * <TR><TD><div id="linechart1" style="width: 1200px; height: 300px;"></div></TD></TR>
 * <TR><TD style="text-align:center; font-size: 20px;"><B><BR/><BR/>Mu1 100Mhz Type B PUSCH</B></TD></TR>
 * <TR><TD><div id="linechart3" style="width: 1200px; height: 300px;"></div></TD></TR>
 * </TABLE>
 *
 * \endhtmlonly
 *
 *
 * <BR/><BR/>
 *
 * @section ref_oran_mode_optimizations ORAN Mode Optimizations
 *
 * Beta Quality criteria for KPI (Key Performance Indicator)/Performance:
 *    - All KPI's tested with each scenario must have less than 15% deviation from target
 *    - Front Haul optimization task to reduce IO cores for 64x64 scenarios from 4 Hyper Threads to 2 Hyper Threads.
 *        - KPI achieved as the IO cores for the 64x64 test scenarios were redcued from 4 Hype Threads to 2 Hyper Threads.
 *        - <b>Beta Quality criteria for oRAN Mode Optimization was achieved.</b>
 *
 * For ORAN mode pipeline, we optimized the IO cores for 64x64 scenarios from 4 Hyper threads to 2 hyper threads. This was accomplished by moving the DL packet header creation 
 * into the BBU cores and absorbing those cycles in the pipeline without adding extra cores. The BBU Core utilization changed from 53% to 61% per core and 2 IO cores were optimized.
 * This is as shown in table below. 
 * <BR/><BR/>
 *
 * <TABLE cellspacing = "0" cellpadding = "2" border = "0" class = "mrcTableBorderClass">
 * <TR><TH class="mrc_platform_head_small" rowspan="2">Use Case</TH><TH class="mrc_platform_head_small" rowspan="2">Test Case</TH><TH class="mrc_platform_head_small" rowspan="2">Number of Cells</TH><TH class="mrc_platform_head_small" rowspan="2">Number of BBU Cores <BR/>(HT Cores)</TH><TH class="mrc_platform_head_small" colspan="2">Number of IO Cores<BR/>for ORAN<BR/>(HT Cores)</TH><TH class="mrc_platform_head_small" rowspan="2">BBU Utilization<BR/>per Core</TH><TH class="mrc_platform_head_small" rowspan="2">Pass/<BR/>Fail</TH></TR>
 * <TR><TH class="mrc_platform_head_small">22.07 Release</TH><TH class="mrc_platform_head_small">22.11 Release</TH></TR>
 * <TR><TH class="mrc_platform">Sub3 Numerology 0 20Mhz 4x4</TH><TH class="mrc_platform">12220</TH><TH class="mrc_platform">12</TH><TH class="mrc_platform">16</TH><TH class="mrc_platform">2</TH><TH class="mrc_platform">2</TH><TH class="mrc_platform">78%</TH><TH class="mrc_platform">Pass</TH></TR>
 * <TR><TH class="mrc_platform">Sub3 Numerology 1 1000Mhz 4x4</TH><TH class="mrc_platform">4304</TH><TH class="mrc_platform">4</TH><TH class="mrc_platform">14</TH><TH class="mrc_platform">2</TH><TH class="mrc_platform">2</TH><TH class="mrc_platform">44%</TH><TH class="mrc_platform">Pass</TH></TR>
 * <TR><TH class="mrc_platform">Sub6 Numerology 1 100Mhz 64x64 8 stream</TH><TH class="mrc_platform">3368</TH><TH class="mrc_platform">3</TH><TH class="mrc_platform">18</TH><TH class="mrc_platform">4</TH><TH class="mrc_platform" style="background-color:rgb(168, 250, 46);">2</TH><TH class="mrc_platform">70%</TH><TH class="mrc_platform">Pass</TH></TR>
 * <TR><TH class="mrc_platform">Sub6 Numerology 1 100Mhz 64x64 16 stream</TH><TH class="mrc_platform">3388</TH><TH class="mrc_platform">3</TH><TH class="mrc_platform">22</TH><TH class="mrc_platform">4</TH><TH class="mrc_platform" style="background-color:rgb(168, 250, 46);">2</TH><TH class="mrc_platform">71%</TH><TH class="mrc_platform">Pass</TH></TR>
 * </TABLE>
 * <BR/><BR/>
 *
 *
 * For more details, please refer to @ref ref_performance_changes.
 *
 * <BR/><BR/>
 *
 * </DIV>
 */


/**
 * @page ref_platforms_and_methodology Testing Platform and Methodology
 * <DIV style="text-align:justify;">
 * This report has 2 types of tests:
 *  - <B>Cycle Count and Latency Benchmarking tests:</B>
 *      - <B>SDK Tests:</B> These are standalone SDK module tests benchmarked across various configurations. They are single threaded and usually run and benchmarked on a warm cache state. Test is run in a loop of 1000 and Mean and Standard Deviation are presented. These tests are run with <B>Hyper Threading disabled</B>.
 *      - <B>Pipeline Tests:</B> These are pipeline tests run using testmac. It is running on multiple cores and run for 10000+ slots. Min, Avg and Max of cycle count and latency are presented. These tests are run under 2 modes
 *          - <B>Timer Mode:</B> There is no external radio dependency and Linux timers are used to generate TTI related events. Pre-canned IQ samples are read/written from/to DDR
 *          - <B>O-RAN Mode:</B> Here we have a second server that runs the oRU emulator software that plays the pre-canned IQ samples over ethernet. The DU receives these and processes UL based on this. There is no external radio dependency and Linux timers are used to generate TTI related events. Pre-canned IQ samples are read/written from/to DDR. These tests
 *                              additionally, include compression / decompression of the IQ samples and timing of packets transmission / arrival is based on O-RAN defined parameters for different use-cases.
 *  - <B>Wireless Performance tests:</B> These are 3GPP 38.104 wireless algorithm tests for UL receiver. This test is run with the testapp application which adds a software based impairment before running through the L1 pipeline. It is a single threaded application.
 *  - All the performance tests in this report are run on <B>bare-metal CentOS</B> configured with FlexRAN performance settings.
 *  - We run tests with <B>Hyperthreading ON</B> only.
 *  - The LDPC FEC functionality is offloaded using one of the following modes in the tests
 *     - Software LDPC (running on Xeon)
 *     - Vista Creek LDPC (N3000)
 *     - Mount Bryce LDPC (ACC100)
 * <BR/><BR/>
 * 
 * <TABLE cellspacing = "0" cellpadding = "2" border = "0" class = "mrcTableBorderClass">
 *   <TR><TD class="mrc_platform_head">Testing Method</TD><TD class="mrc_platform_head">Timer Mode Testing</TD><TD class="mrc_platform_head">O-RAN Mode Testing</TD></TR>
 *   <TR><TD class="mrc_platform"><B>Picture</B></TD><TD class="mrc_platform"><IMG src="testing-timer-mode.png"/></TD><TD class="mrc_platform"><IMG src="testing-xran-mode.png"/></TD></TR>
 *   <TR><TD class="mrc_platform"><B>LDPC FEC Offload</B></TD><TD class="mrc_platform">Mount Bryce</TD><TD class="mrc_platform">Mount Bryce</TD></TR>
 *   <TR><TD class="mrc_platform"><B>FH NIC Card</B></TD><TD class="mrc_platform">N/A</TD><TD class="mrc_platform">Fortville 2x25G NIC</TD></TR>
 * </TABLE>
 * <BR/><BR/>
 * 
 * @section ref_platforms Testing Setup details
 * We benchmark the 22.11 release on the following hardware platforms:
 * - <B>Cascade Lake SP 6248</B> (20 core) running at 2.5Ghz. This is an Intel Wolfpass platform
 * - <B>Ice Lake SP 6338N</B> (32 cores) running at 2.5Ghz. This is an Intel Coyotepass platform
 * - <B>Ice Lake D</B> (10 cores) running at 2.4Ghz. This is an Intel pre-production platform
 * 
 * The Operating system we have used for this release is CentOS Linux release 7.8.2003 with kernel version (3.10.0-1127.19.1.rt56.1116.el7.x86_64).
 *  
 * <BR/>
 *
 * @section ref_methodology Profiling Methodology
 * The picture below shows an example of methodology used for profiling the tests for benchmarking. In this example
 *    - There are 2 cells (green and blue)
 *    - Each cell has 4 tasks each
 *    - We also offload something to the FEC after task 2 and continue with task 3 after FEC comes back
 *    - Given this, we have the following statistics we collect in each test
 *        - <B>A: Cores / Cell from cycle count</B> = [ (C0_1 + C0_2 + C0_3 + C0_4) + (C1_1 + C1_2 + C1_3 + C1_4) ] / 2 Cells
 *            - This metric is reported separately for:
 *                - DL Tasks
 *                - UL Tasks
 *                - SRS Tasks
 *                - DL Beamforming Tasks
 *                - UL Beamforming Tasks
 *            - These tasks are reported as a number of cores per cell. The numbers are presented with a 1 TTI budget processing budget
 *                - If there are some assumptions on increased processing budget for a particular task, then this number can be scaled accordingly.
 *        - <B>B: Pipeline Latency</B> = The TTI Processing Time from the graph above.
 *            - The latency metric is reported separately for:
 *                - DL Latency
 *                - UL Latency
 *                - SRS Latency
 *                - DL FEC Link Latency
 *                - UL FEC Link Latency
 *            - Min, Avg and Max numbers are presented in the report.
 *
 * <BR/><BR/>
 * <IMG src="profiling-methology.png"/>
 *
 * <BR/>
 * @section ref_different_methdology Performance Comparison charts
 * Throughout this report, there will be many sections when we compare 2 tests and show a difference (in percentage). For these, the method used for computing the difference is as shown below:
 * <BR/><BR/><BR/>
 *
 * <!--
 * <TABLE cellspacing = "0" cellpadding = "2" border = "0" class = "mrcTableBorderClass">
 * <TR><TD class="mrc_platform_head">Method</TD><TD class="mrc_platform_head">Left Value</TD><TD class="mrc_platform_head">Right Value</TD><TD class="mrc_platform_head">DIFF</TD></TR>
 * <TR><TD class="mrc_platform"><B>Method 1</B></TD><TD class="mrc_platform"><B>A</B></TD> <TD class="mrc_platform"><B>B</B></TD> <TD class="mrc_platform"><B>C = (1 - (B / A))</B><BR/><I>(In Percent)</I></TD></TR>
 * <TR><TD class="mrc_platform"><B>Method 2</B></TD><TD class="mrc_platform"><B>A</B></TD> <TD class="mrc_platform"><B>B</B></TD> <TD class="mrc_platform"><B>C = ((A / B) - 1)</B><BR/><I>(In Percent)</I></TD></TR>
 * </TABLE>
 *
 * <BR/><BR/>
 * Let’s take a couple of examples
 *  - Example 1: <B>A = 0.2</B> and <B>B = 0.1</B>
 *     - <B>Method 1</B>: C would become <B>(1 - (0.1 / 0.2)) = 50%</B>. We interpret this as <B>B is 50% lesser than A</B>.
 *     - <B>Method 2</B>: C would become <B>((0.2 / 0.1)  - 1) = 100%</B>. We interpret this as <B>A is 100% more than B</B>.
 *  - Example 2: <B>A = 0.4</B> and <B>B = 0.8</B>
 *     - <B>Method 1</B>: C would become <B>(1 - (0.8 / 0.4)) = -100%</B>. We interpret this as <B>B is 100% more than A</B>.
 *     - <B>Method 2</B>: C would become <B>((0.4 / 0.8)  - 1) = -50%</B>. We interpret this as <B>A is 50% lesser than B</B>.
 * -->
 *
 * <TABLE cellspacing = "0" cellpadding = "2" border = "0" class = "mrcTableBorderClass">
 * <TR><TD class="mrc_platform_head">Left Value</TD><TD class="mrc_platform_head">Right Value</TD><TD class="mrc_platform_head">DIFF</TD></TR>
 * <TR><TD class="mrc_platform"><B>A</B></TD> <TD class="mrc_platform"><B>B</B></TD> <TD class="mrc_platform"><B>C = ((A / B) - 1)</B><BR/><I>(In Percent)</I></TD></TR>
 * </TABLE>
 *
 * <BR/><BR/>
 * Let’s take a couple of examples
 *  - Example 1: <B>A = 0.2</B> and <B>B = 0.1</B>
 *     - C would become <B>((0.2 / 0.1)  - 1) = 100%</B>. We interpret this as <B>A is 100% more than B</B>.
 *  - Example 2: <B>A = 0.4</B> and <B>B = 0.8</B>
 *     - C would become <B>((0.4 / 0.8)  - 1) = -50%</B>. We interpret this as <B>A is 50% lesser than B</B>.
 *
 * <BR/>
 * @section ref_task_breakdown Report Task Breakdown
 * Throughout this report, we present profiling information in tables which have the following sections:
 *    - <B style="color:red;">Level 0</B><B> - Test description</B>
 *        - <B>Test Number</B>: Unique number of the test.
 *        - <B>Options</B>: This shows all the various L1 dynamic parameters that have been set for running the test. Things like task split size and FEC decoder related parameters.
 *        - <B>PhyStart Mode</B>: This shows the Mode, Period and Count for the PHY_START API that has been programmed to the L1 from MAC
 *        - <B>Hyperthreading state</B>: enabled (ON) or disabled (OFF).
 *        - <B>LDPC Offload</B>: Can be VISTA_CREEK, MOUNT_BRYCE or SOFT_LDPC.
 *        - <B>Number of cells</B> run in the test.
 *        - <B>Number of Regular BBU cores</B> used in the test: These are logical cores which means 
 *            - If HT is disabled, each core is a physical core.
 *            - If HT is enabled, each core is a hyper-threaded core.
 *        - <B>Regular BBU Core Used Mask</B>: 64 bit Mask in Hex
 *        - <B>Number of DL Beamforming BBU cores</B> used in the test: For Massive MIMO tests some BBU cores are set aside for DL Beamforming. These are logical cores.
 *        - <B>DL Beamforming BBU Core Used Mask</B>: 64 bit Mask in Hex
 *        - <B>Number of SRS BBU cores</B> used in the test: For Massive MIMO tests some BBU cores are set aside for SRS Processing. These are logical cores.
 *        - <B>SRS BBU Core Used Mask</B>: 64 bit Mask in Hex
 *        - <B>Total Cores Needed (based on 1 TTI budget for processing the tasks)</B>: These are the total number of logical cores needed per cell for processing the tasks <B style="text-decoration: underline; color:red;">assuming 1TTI budget is allocated</B> for the processing.
 *       The table below shows all the information in this category and associated High Level breakdown tasks (See Level 2 below) that are part of the calculation<BR/><BR/>
 * <TABLE cellspacing = "0" cellpadding = "6" border = "2" class = "mrcTableBorderClass">
 * <TR><TD style="font-weight:bold; font-size: 20px;">Total Cores</TD><TD style="font-weight:bold; font-size: 20px;">Comprised of High Level Breakdown tasks <I>(See Level 2 below)</I></TD></TR>
 * <TR><TD style="font-weight:bold;">TOTAL DL Logical Cores (Per Cell)</TD><TD>- PDSCH<BR/>- PDSCH FEC<BR/>- DL CONTROL<BR/>- DL API<BR/>- OTHERS</TD></TR>
 * <TR><TD style="font-weight:bold;">TOTAL UL Logical Cores (Per Cell)</TD><TD>- PUSCH<BR/>- PUSCH FEC<BR/>- PUCCH<BR/>- PRACH<BR/>- UL API</TD></TR>
 * <TR><TD style="font-weight:bold;">TOTAL SRS Logical Cores (Per Cell)</TD><TD>- SRS</TD></TR>
 * <TR><TD style="font-weight:bold;">TOTAL DL Beamforming Logical Cores (Per Cell)</TD><TD>- DL BEAM</TD></TR>
 * <TR><TD style="font-weight:bold;">TOTAL UL Beamforming Logical Cores (Per Cell)</TD><TD>- UL BEAM</TD></TR>
 * <TR><TD style="font-weight:bold;">Normalized<sup>1</sup> Logical Core Util (Average)</TD><TD>This is computed within the BBUPool Framework for the amount of time real L1 work is being run on these cores.</TD></TR>
 * <TR><TD style="font-weight:bold;">Normalized<sup>1</sup> DL Beamforming Logical Core Util (Average)</TD><TD>This is computed within the BBUPool Framework for the cores allocated for DL Beamforming (Massive MIMO).</TD></TR>
 * <TR><TD style="font-weight:bold;">Normalized<sup>1</sup> SRS Logical Core Util (Average)</TD><TD>This is computed within the BBUPool Framework for the cores allocated for SRS Processing (Massive MIMO).</TD></TR>
 * </TABLE><BR/>
 *        - Normalized<sup>1</sup> here is applicable when comparing 2 tests to show a diff. 
 *           - The case where normalization needs to be done is when each of the test are performed with different number of cores.
 *           - The numbers are then presented normalized to the higher of the 2 tests.
 *           - So, for example if test 1 was run with 5 cores at 50% utilization and test 2 was run with 3 cores at 70% utilization.
 *           - <B>Normalized</B> numbers would be presented as Test1: 50% and Test2: 42% (assuming test was run on 5 cores).
 *        - If the test is a <B>URLLC Test</B>, then the following additional Latency numbers are also displayed. They are presented in usecs and also in number of symbols
 *            - <B>GNB_URLLC_DL_TASK</B>: DL Processing time for each mini-slot
 *            - <B>GNB_URLLC_UL_TASK</B>: UL Processing time for each mini-slot
 *            - <B>GNB_URLLC_DL_TOTAL_TASK</B>: This includes the latency of WLS API transfer from L2 to L1 + GNB_URLLC_DL_TASK
 *            - <B>GNB_URLLC_UL_TOTAL_TASK</B>: This includes the latency of WLS API transfer from L2 to L1 + GNB_URLLC_UL_TASK
 * <BR/><BR/>
 *    - <B style="color:red;">Level 1</B><B> - Avg (across all Cells) Processing Latency (% of TTI)</B>: These are the Processing latency taken by the tasks in the test for each of the channels (will be the worst case cell).
 *        - DL Processing Latency (Min, Avg and Max)
 *        - UL Processing Latency (Min, Avg and Max)
 *        - SRS Processing Latency (Min, Avg and Max)
 *        - DL FEC Link Latency
 *        - UL FEC Link Latency
 * <BR/><BR/>
 *    - <B style="color:red;">Level 2</B><B> - High Level Break Down per Cell (in usecs)</B>: This section gives a high level task breakdown for each task per cell in usecs. The table below shows all the 
 *         break down categories and the associated BBU tasks that comprise of the total usecs. The cells are color coded to match up the figure in @ref ref_bbu_tasks<BR/><BR/>
 * <TABLE cellspacing = "0" cellpadding = "6" border = "2" class = "mrcTableBorderClass">
 * <TR><TD style="font-weight:bold; font-size: 20px;">High Level Breakdown</TD><TD style="font-weight:bold; font-size: 20px;">Comprised of BBU Tasks <I style="color:red;">(Task ID part of Level 3 in the reports)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(201,201,201);">DL CONTROL</TD><TD>- NR5G1_DL_CTRL <I style="color:red;">(GNB_DL_CSI_PROC, GNB_DLDCI_PROC, GNB_DLUCI_PROC, GNB_DL_PBCH_PROC)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(103,140,207);">PDSCH</TD><TD>- NR5G1_DL_PDSCH_SCRM <I style="color:red;">(GNB_PDSCH_SCRAMBLER)</I><BR/>- NR5G1_DL_PDSCH_SYM <I style="color:red;">(GNB_DL_SYMBOL_PROC, GNB_DL_IQ_COMPRESS)</I><BR/>- NR5G1_DL_PDSCH_RS <I style="color:red;">(GNB_PDSCH_RS)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(248,217,212);">PDSCH FEC</TD><TD>- PRE_NR5G1_DL_PDSCH_TB <I style="color:red;">(GNB_PDSCH_TB_CRC, GNB_PDSCH_CB_SETUP)</I><BR/>- NR5G1_DL_PDSCH_TB <I style="color:red;">(GNB_PDSCH_TB_QUEUE)</I><BR/></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(126,196,42);">PUSCH FEC</TD><TD>- PRE_NR5G1_UL_PUSCH_DEC <I style="color:red;">(GNB_PUSCH_CB_SETUP)</I><BR/>- NR5G1_UL_PUSCH_DEC <I style="color:red;">(GNB_PUSCH_DECODER)</I><BR/>- NR5G1_UL_PUSCH_TB <I style="color:red;">(GNB_PUSCH_TB)</I></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(255,217,102);">PUSCH</TD><TD>- NR5G1_UL_PUSCH_CE0 <I style="color:red;">(GNB_PUSCH_CE_SYMB0, GNB_UL_IQ_DECOMPRESS)</I><BR/>- NR5G1_UL_PUSCH_CE7 <I style="color:red;">(GNB_PUSCH_CE_SYMB7, GNB_UL_IQ_DECOMPRESS)</I><BR/>- NR5G1_UL_PUSCH_EQL0 <I style="color:red;">(GNB_PUSCH_MMSE_SYMB0, GNB_UL_IQ_DECOMPRESS, GNB_PUSCH_RX_SYMB0)</I><BR/>- NR5G1_UL_PUSCH_EQL7 <I style="color:red;">(GNB_PUSCH_MMSE_SYMB7, GNB_UL_IQ_DECOMPRESS, GNB_PUSCH_RX_SYMB7)</I><BR/>- NR5G1_UL_PUSCH_LLR <I style="color:red;">(GNB_PUSCH_DEMOD_SYMB7, GNB_PUSCH_DESCRAMBLE, GNB_PUSCH_UCI_DECODER)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(226,239,218);">PUCCH</TD><TD>- NR5G1_UL_PUCCH <I style="color:red;">(GNB_PUCCH_RX, GNB_UL_IQ_DECOMPRESS)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(204,134,134);">PRACH</TD><TD>- NR5G1_UL_PRACH <I style="color:red;">(GNB_PRACH_PROCESS)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(206,196,226);">SRS</TD><TD>- NR5G1_UL_SRS_DECOMP <I style="color:red;">(GNB_UL_SRS_IQ_DECOMPRESS, GNB_SRS_RX)</I><BR/>- NR5G1_UL_SRS_CE <I style="color:red;">(GNB_SRS_CE)</I><BR/>- NR5G1_UL_SRS_CE_POST <I style="color:red;">(GNB_SRS_CE_POST)</I><BR/>- NR5G1_UL_SRS_POST <I style="color:red;">(GNB_SRS_REPORT)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(121,212,217);">DL BEAM</TD><TD>- NR5G1_DL_BEAM_GEN <I style="color:red;">(GNB_DL_BEAM_WEIGHT_TASK)</I><BR/>- NR5G1_DL_BEAM_TX <I style="color:red;">(GNB_DL_BEAM_WEIGHT_COMPRESS)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(107,219,176);">UL BEAM</TD><TD>- NR5G1_UL_BEAM_GEN <I style="color:red;">(GNB_UL_BEAM_WEIGHT_TASK)</I><BR/>- NR5G1_UL_BEAM_TX <I style="color:red;">(GNB_UL_BEAM_WEIGHT_COMPRESS)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(217, 225, 242);">MAC-PHY API</TD><TD>- NR5G1_DL_CONFIG <I style="color:red;">(GNB_DL_CFG)</I><BR/>- NR5G1_UL_CONFIG <I style="color:red;">(GNB_UL_CFG)</I></TD></TR>
 * <TR><TD style="font-weight:bold; background-color:rgb(201,141,33);">OTHERS</TD><TD>- NR5G1_DL_POST <I style="color:red;">(GNB_DL_RESET_BUF, GNB_DL_POST)</I><BR/>- NR5G1_UL_POST <I style="color:red;">(GNB_UL_POST)</I></TD></TR>
 * </TABLE>
 * <BR/><BR/>
 *    - <B style="color:red;">Level 3</B><B> - Task Level Break Down Averaged per Cell (in usecs)</B>: This section gives a detailed task level breakdown per cell in usecs. The table above shows all the 
 *         tasks (in red) and associated BBU Task that this task ID is registered in.
 * 
 *    - <B style="color:red;">Level 4</B><B> - Processing Latency and Task Level Break Down (in usecs) presented for each cell</B>: This section presents the Level 1 Latency and Level 3 Task Level Breakdown for each Cell.
 * 
 * <BR/><BR/>
 * 
 * @section ref_bbu_tasks BBU Tasks Composition
 * The figure below illustrates all the BBU tasks created in the current 5GNR pipeline. It shows a constitution of all BBU tasks and their dependencies that make up the <B>High Level Break Down per cell</B> in the table above.
 * There are external events A-I which will unlock some of the BBU tasks as described below.
 *   - <B>A</B>: Event triggered at TTI Boundary (sym 0) and kick starts API processing
 *   - <B>B</B>: Event triggered when First DMRS Symbols arrives from Radio (sym 2) and kick starts PUSCH Channel Estimation 0
 *   - <B>C</B>: Event triggered when First Half Slot arrives from Radio (sym 6) and kick starts PUSCH Equalizer 0
 *   - <B>D</B>: Event triggered when Last DMRS Symbols arrives from Radio (sym 11) and kick starts PUSCH Channel Estimation 7
 *   - <B>E</B>: Event triggered when Second Half Slot arrives from Radio (sym 13) and kick starts PUSCH Equalizer 7, PUCCH and SRS (Non-Massive MIMO)
 *   - <B>F</B>: Event triggered when PRACH IQ arrives from Radio (~sym 13) and kick starts PRACH Processing
 *   - <B>G</B>: Event triggered when SRS IQ arrives from Radio (after sym 13) and kick starts SRS Processing (Massive MIMO)
 *   - <B>H</B>: Event triggered when PDSCH FEC Processing is completed and kick starts the PDSCH Scrambler function
 *   - <B>I</B>: Event triggered when PUSCH FEC Processing is completed and kick starts the PUSCH TB CRC Check and PDU Creation function
 *
 * <BR/><BR/>
 * <IMG src="profiling-breakdown.png"/>
 *
 * <BR/>
 * @section ref_ebbu_pool Enhanced BBUPool Framework (eBBUPool)
 * In this release, we have added a new eBBUPool framework that helps implement features like DSS / Multi-Numerology. 
 * We have run all the use-cases using this new framework and provide a performance delta with the old framework in this release.
 * In future releases, eBBUPool will be the default and only supported framework.
 *
 * <BR/><BR/>
 * <IMG src="profiling-breakdown-ebbupool.png"/>
 *
 * <BR/>
 * @section ref_oran_tests O-RAN Pipeline Tests for performance
 * In this release, we provide a set of O-RAN config files for each of the use cases that can be used to run with the ORU emulator and FlexRAN DU pipeline to benchmark cycle count and latency.
 *    - In this mode, we additionally do the <B>compression / decompression</B> on top of the timer mode tests and UL latency will <B>include the additional O-RAN timing</B> as defined for each use-case
 *    - In the DU pipeline today:
 *       - We <B>send/receive all RBs to/from the RU</B> in each TTI for each cell as defined in the xml config files
 *          - This is <B>statically fixed and read from config files</B> for the test.
 *          - In the real deployments, we need to use the MAC config in each TTI and send / receive only used RBs to/from the radio
 *       - We do <B>memset the entire DL grid</B> before actually filling it with IQ samples
 *          - This is because the <B>O-RAN Radio's that we have today</B> require the DU to send the <B>entire Symbol (used / unused RBs) to the Radio</B>
 *          - In real deployments with O-RAN compliant radio's, this <B>memset will be removed from the DU</B> and only used RBs will be sent to the radio.
 *       - In the performance report, this <B>memset is enabled by default</B> for all the use-cases and will be <B>removed in future reports with an enable / disable option</B>.
 *
 * <BR/>
 *
 * @section ref_oran_tests_scope Future scope for O-RAN Pipeline Optimizations
 * The current pipeline has multiple cores for ORAN processing. For massive MIMO scenarios we have a total of 4 hyperthreads needed for ORAN processing
 *  - 2 of them are doing Tx packet header creation
 *  - 1 is polling Rx queues, packet classification and put them to the application queues
 *  - 1 is dealing with timing, waking up tasks on BBU cores and polling BBDEV devices
 * <BR/><BR/>
 *
 * As an optimization, we are looking at moving the Tx packet header creation functions into the BBU which a small increase in BBU core utilization. This way 2 cores
 * can be optimized away. This will be addressed in the next release.
 *
 *
 * <BR/><BR/>
 *
 *
 * </DIV>
 */


/**
 * @page ref_future_scope Future scope for improvements
 * <DIV style="text-align:justify;">
 *
 * <BR/><BR/>
 * </DIV>
 *
**/

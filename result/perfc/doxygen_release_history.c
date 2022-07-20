/*******************************************************************************
 *
 * <COPYRIGHT_TAG>
 *
 *******************************************************************************/

/**
 * @brief FlexRAN release History
 * @file doxygen_release_history.c
 * @author Intel Corporation
 **/


/**
 * @page ref_flexran_release_history FlexRAN Release History
 * <DIV style="text-align:justify;">
 *
 * <div style="font-size:15px;">
 * This section details all the <B>Major FlexRAN releases</B>. It shows the High level changes to 
 *  - Software features and components
 *  - Intel Hardware components
 *  - Basic Operating System support
 *  - Other Third Party hardware components used to validate the FlexRAN releases
 * </div>
 *
 * \htmlonly
 *   <div class="main_body">
 *     <div class="main_div">
 *     <div class="release_div release_div1">
 *         <div class="release_container">
 *           <b>18</b>
 *           <div class="release_date">Mar 2022</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 22.03</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Refactor UL SDK functions using C++ templates and dvec library to support SPR and AVX512
 *               </li>
 *               <li>
 *                  32x32 Massive MIMO pipeline feature enhancements and fixes based on integration activities
 *               </li>
 *               <li>
 *                  ORAN support for LTE pipeline (limited testing) and enhancements for Extension type 11 (CAT-B radios)
 *               </li>
 *               <li>
 *                  Testmac enhamcements to take real world L1 scheduling information and play with L1App (for cycle count and power benchmarking)
 *               </li>
 *               <li>
 *                  eBBUPool scheduler optimizations and feature enhancements for power savings
 *               </li>
 *               <li>
 *                  Upgrade DPDK to 21.11
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: CascadeLake-SP, IceLake-SP, IceLake-D, Sapphire-Rapids-SP (Pre PRQ, Early Silicon)
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Mount Bryce (ACC100)], LTE [Software based, Vista Creek (N3000), Mount Bryce (ACC100)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [ORAN: Fortville NIC, ColumbiaVille NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Foxconn Sub6 radio]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7.9, Centos 8, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icx (One Api Compiler), DPDK 21.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div9">
 *         <div class="release_container">
 *           <b>17</b>
 *           <div class="release_date">Nov 2021</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 21.11</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Support for OneAPI tool chain for FlexRAN compilation. This will add support for SPR CPU
 *               </li>
 *               <li>
 *                  Additional code refactoring of SDK modules to prepare for future 5GISA FP16 release.
 *               </li>
 *               <li>
 *                  8T8R standard MIMO support in pipeline and new test cases added
 *               </li>
 *               <li>
 *                  DSS enhacements and LTE+5GNR code unification and clean up. Added single binary support with enahacements to Tasklist per RAT
 *               </li>
 *               <li>
 *                  Optimizations to XRAN library: Move DL packet header creation to BBUPool cores using runtime flag
 *               </li>
 *               <li>
 *                  Support in pipeline to test FEC only tasks (for hardware stress testing)
 *               </li>
 *               <li>
 *                  Update UL API timing for Massive MIMO to be inline with beam weight processing and transport requirements
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: CascadeLake-SP, IceLake-SP, IceLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Mount Bryce (ACC100)], LTE [Software based, Vista Creek (N3000), Mount Bryce (ACC100)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [ORAN: Fortville NIC, ColumbiaVille NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Foxconn Sub6 radio]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7.9, Centos 8, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), icx (One Api Compiler), DPDK 20.11.3
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div8">
 *         <div class="release_container">
 *           <b>16</b>
 *           <div class="release_date">Jul 2021</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 21.07</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Advanced Wireless receivers for PUSCH / PUCCH and PRACH enabled by default in all benchmarking tests
 *               </li>
 *               <li>
 *                  ORAN Pipeline optimizations to move compression and decompression onto same cores as predecessor / successor function so there is cache localization
 *               </li>
 *               <li>
 *                  Mount Bryce (ACC100) / Vista Creek (N3000) protections added to driver and enhanced testing to cover all corner cases that could put hardware to bad state
 *               </li>
 *               <li>
 *                  eBBUPool enhancements to reduce internal scheduler overheads
 *               </li>
 *               <li>
 *                  Power savings techniques for VRAN
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: CascadeLake-SP, IceLake-SP, IceLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Mount Bryce (ACC100)], LTE [Software based, Vista Creek (N3000), Mount Bryce (ACC100)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [ORAN: Fortville NIC, ColumbiaVille NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Foxconn Sub6 radio]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Centos 8, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 20.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div7">
 *         <div class="release_container">
 *           <b>15</b>
 *           <div class="release_date">Mar 2021</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 21.03</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Added Enhanced BBUPool framework fully integrated with L1 pipelines (LTE and 5GNR). This is to support DSS / Multi numerology on same pool of cores.
 *               </li>
 *               <li>
 *                  Multi-Numerology on same pool support
 *               </li>
 *               <li>
 *                  First release with memory usage optimizations
 *               </li>
 *               <li>
 *                  Multi-cell validation with commercial UE and multiple Foxconn Radios connected to Single DU pod.
 *               </li>
 *               <li>
 *                  Started validation on IceLake-D platforms for small cell / enterprise use-case
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: SkyLake-D, CascadeLake-SP, IceLake-SP, IceLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Mount Bryce (ACC100)], LTE [Software based, Vista Creek (N3000), Mount Bryce (ACC100)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [ORAN: Fortville NIC, ColumbiaVille NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Foxconn Sub6 radio] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 20.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div6">
 *         <div class="release_container">
 *           <b>14</b>
 *           <div class="release_date">Nov 2020</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 20.11</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Wireless performance improvements for PUSCH and PUCCH channels
 *               </li>
 *               <li>
 *                  URLLC updates to support multi-core and multi-cell scenarios. ORAN support also added
 *               </li>
 *               <li>
 *                  Sub6 100Mhz 4x4 integration with FoxConn Radio and attached with commercial UE (using partner stack and FlexCore 5GCore)
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: SkyLake-D, CascadeLake-SP, IceLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Mount Bryce (ACC100)], LTE [Software based, Vista Creek (N3000), Mount Bryce (ACC100)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [ORAN: Fortville NIC, ColumbiaVille NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Foxconn Sub6 radio] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 19.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div5">
 *         <div class="release_container">
 *           <b>13</b>
 *           <div class="release_date">Aug 2020</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 20.08</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  First release with support for IceLake, MountBryce and Columbiaville NIC
 *               </li>
 *               <li>
 *                  First release validating 38.104 wireless performance tests on PUSCH pipeline
 *               </li>
 *               <li>
 *                  New L1 optimizations targeting IceLake specific instruction sets
 *               </li>
 *               <li>
 *                  16 stream based massive MIMO UL receiver chain. Advanced ICC based receiver algorithm updates
 *               </li>
 *               <li>
 *                  Multi radio to DU support added from ORAN front haul.
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: SkyLake-D, CascadeLake-SP, IceLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Mount Bryce (ACC100)], LTE [Software based, Vista Creek (N3000), Mount Bryce (ACC100)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [ORAN: Fortville NIC, ColumbiaVille NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Commscope MMWAVE] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 19.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div4">
 *         <div class="release_container">
 *           <b>12</b>
 *           <div class="release_date">Apr 2020</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 20.04</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Massive MIMO pipeline for 64x64 use-cases. DL and UL Multi-user MIMO pipelines added
 *               </li>
 *               <li>
 *                  Initial URLLC support added.
 *               </li>
 *               <li>
 *                  Improved 5GNR 3GPP feature set based on customer feedback
 *               </li>
 *               <li>
 *                  ORAN Block Floating point compression and decompression schemes added and validated
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: SkyLake-D, CascadeLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Terasic Based FPGA (POC)], LTE [Software based, Vista Creek (N3000)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [Terasic Based FPGA (POC), ORAN: Fortville NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Commscope MMWAVE] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 19.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div3">
 *         <div class="release_container">
 *           <b>11</b>
 *           <div class="release_date">Feb 2020</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 20.02</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Massive MIMO pipeline for 32x32 use-cases
 *               </li>
 *               <li>
 *                  IceLake Platform benchmarking started on Wilson City platforms
 *               </li>
 *               <li>
 *                  Early support and testing for Mount Bryce (ACC100)
 *               </li>
 *               <li>
 *                  ORAN Block Floating point compression and decompression schemes added and validated. Integrated ORAN based FlexRAN L1 pipeline with Commscope radio (MMWAVE)
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: SkyLake-D, CascadeLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Terasic Based FPGA (POC)], LTE [Software based, Vista Creek (N3000)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [Terasic Based FPGA (POC), ORAN: Fortville NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Commscope MMWAVE] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 18.08
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div2">
 *         <div class="release_container">
 *           <b>11</b>
 *           <div class="release_date">Oct 2019</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 19.10</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Vista Creek (N3000) based 5GNR LDPC offload integrated into pipeline
 *               </li>
 *               <li>
 *                  Improved Algorithms for PUSCH chain for wireless performance
 *               </li>
 *               <li>
 *                  Validated End2End with TM500 in NSA and SA mode and partner stack for 20Mhz 4x4 use case (with Ferry Bridge and AceAxis Radio in Option 8 mode)
 *               </li>
 *               <li>
 *                  Single v/s Dual Socket, Single v/s Dual Rank Memory, Single v/s Multiple Applications analysis
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: SkyLake-SP, SkyLake-D, CascadeLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Vista Creek (N3000), Terasic Based FPGA (POC)], LTE [Software based, Vista Creek (N3000)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [Terasic Based FPGA (POC), ORAN: Fortville NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Commscope MMWAVE] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 18.08
 *               </li>
 *             </ul>
 *            </p>
 *          </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div1">
 *         <div class="release_container">
 *           <b>10</b>
 *           <div class="release_date">Jun 2019</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 19.06</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Optimizations for NR pipeline and SDK functions to show 20%+ improvement.
 *               </li>
 *               <li>
 *                  Validated MMWAVE End2End with testmac integrated with Commscope RRU
 *               </li>
 *               <li>
 *                  ORAN library validated with Commscope RRU (MMWAVE)
 *               </li>
 *               <li>
 *                  BBDEV based software LDPC implementation and enablement
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP, SkyLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Software Based, Terasic Based FPGA (POC)], LTE [Software based, Vista Creek (N3000)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [Terasic Based FPGA (POC), ORAN: Fortville NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: 5GNR [Commscope MMWAVE] LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based containers
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 18.08
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div9">
 *         <div class="release_container">
 *           <b>&nbsp;9</b>
 *           <div class="release_date">Mar 2019</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 19.03</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Focus completely shifted to 5GNR with support for Sub3 and Sub6 Narrow Band 4x4 use-cases
 *               </li>
 *               <li>
 *                  Validated MMWAVE End2End with testmac integrated with Commscope RRU
 *               </li>
 *               <li>
 *                  ORAN library validated with Commscope RRU (MMWAVE)
 *               </li>
 *               <li>
 *                  Vista Creek Fully integrated with LTE pipeline
 *               </li>
 *               <li>
 *                  Fully integrated code that enabled testing for LTE and NR pipelines using common infrastructure functions and Testmac (as separate binaries)
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP, SkyLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Terasic Based FPGA (POC)], LTE [Software based, Vista Creek (N3000)]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [Terasic Based FPGA (POC), ORAN: Fortville NIC]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, Kubernetes based testing
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 18.08
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div8">
 *         <div class="release_container">
 *           <b>&nbsp;8</b>
 *           <div class="release_date">Dec 2018</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 18.12</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  First 5GNR release. Code was split into LTE and NR deliverables
 *               </li>
 *               <li>
 *                  5G supported MMWAVE integrated with Terasic based FPGA to show FlexRAN based implementation of gNodeB and UE interoperating
 *               </li>
 *               <li>
 *                  Vista Creek Fully integrated with LTE pipeline
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP, SkyLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: 5GNR [Terasic Based FPGA (POC)], LTE [Software based, Vista Creek]
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: 5GNR [Terasic Based FPGA (POC)]
 *               </li>
 *               <li>
 *                  <B>RRU</B>: LTE [Ace Axis]
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, WindRiver Titanium, Kubernetes 1.9 support and testing
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 18.08
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div7">
 *         <div class="release_container">
 *           <b>&nbsp;7</b>
 *           <div class="release_date">Sep 2018</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 18.09</div>
 *             <p>
 *               <ul>
 *               <li>
 *                  BBDEV API integration into FlexRAN reference stack. Pre-Vista Creek integration
 *               </li>
 *               <li>
 *                  More AVX512 SkyLake optimization targeting control channels
 *               </li>
 *               <li>
 *                  Multi VM mode testing on single platform
 *               </li>
 *               <li>
 *                  XRAN library development starting with U-Plane
 *               </li>
 *               <li>
 *                  Benchmarking on SkyLake-D platforms
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP, SkyLake-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based, Pre Vista Creek (MAP Card)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: Ferry Bridge (POC FPGA) converting Packets to CPRI, Niantic NIC, Fortville
 *               </li>
 *               <li>
 *                  <B>RRU</B>: Ace Axis
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, WindRiver Titanium, Kubernetes 1.9 support and testing
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 18.08
 *               </li>
 *             </ul>
 *            </p>
 *         </div>
 *     </div>
 *     <div class="release_div release_div6">
 *         <div class="release_container">
 *           <b>&nbsp;6</b>
 *           <div class="release_date">Jun 2018</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 1.6</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Test cases modified to also include control channels to be more like real-world scenarios.
 *               </li>
 *               <li>
 *                  Radio over Ethernet support (ROE - 1914.3)
 *               </li>
 *               <li>
 *                  1588 latency and jitter analysis
 *               </li>
 *               <li>
 *                  Integrated nFAPI API between MAC-PHY to support ORAN
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based and Waddle Creek (POC FPGA)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: Ferry Bridge (POC FPGA) converting Packets to CPRI, Niantic NIC, Fortville
 *               </li>
 *               <li>
 *                  <B>RRU</B>: Ace Axis
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, WindRiver Titanium, Kubernetes 1.9 support and testing
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 17.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div5">
 *         <div class="release_container">
 *           <b>&nbsp;5</b>
 *           <div class="release_date">Mar 2018</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 1.5</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  AVX512 optimizations and gains of 100% achieved on many modules when comparing AVX2 on Broadwell
 *               </li>
 *               <li>
 *                  Automated profiling enhancements using MLOG. Lot more customer based test cases benchmarked and optimized
 *               </li>
 *               <li>
 *                  Hyperthreading enabled by default and detailed analysis on impact to vRAN
 *               </li>
 *               <li>
 *                  Integrated nFAPI API between MAC-PHY to support ORAN
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based and Waddle Creek (POC FPGA)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: Ferry Bridge (POC FPGA) converting Packets to CPRI, Niantic NIC, Fortville
 *               </li>
 *               <li>
 *                  <B>RRU</B>: Ace Axis
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, WindRiver Titanium
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 17.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div4">
 *         <div class="release_container">
 *           <b>&nbsp;4</b>
 *           <div class="release_date">Dec 2017</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 1.4</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  Config TDP (AVX512 P1 frequency setting) used as default for SkyLake to avoid throttling effects
 *               </li>
 *               <li>
 *                  Customer test case benchmarking using testmac timer mode
 *               </li>
 *               <li>
 *                  Integrated with DPDK for front haul and investigation of DDP feature on Fortville NIC
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based and Waddle Creek (POC FPGA)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: Ferry Bridge (POC FPGA) converting Packets to CPRI, Niantic NIC, Fortville
 *               </li>
 *               <li>
 *                  <B>RRU</B>: Ace Axis
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, WindRiver Titanium
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 16.11
 *               </li>
 *             </ul>
 *            </p>
 *          </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div3">
 *         <div class="release_container">
 *           <b>&nbsp;3</b>
 *           <div class="release_date">Sep 2017</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 1.3</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  First release on SkyLake Platform. Some optimizations using AVX512 instruction set
 *               </li>
 *               <li>
 *                  Investigation on frequency throttling when using AVX512.
 *               </li>
 *               <li>
 *                   Enabled Hyperthreading feature on processor with FlexRAN
 *               </li>
 *               <li>
 *                  First release validated on OVP6 (Virtualized Environment)
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D, Broadwell-EP, SkyLake-SP
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based and Waddle Creek (POC FPGA)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: Ferry Bridge (POC FPGA) converting Packets to CPRI, Niantic NIC
 *               </li>
 *               <li>
 *                  <B>RRU</B>: Ace Axis
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, WindRiver Titanium
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 16.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div2">
 *         <div class="release_container">
 *           <b>&nbsp;2</b>
 *           <div class="release_date">Jun 2017</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 1.2</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  First release integrated with BBUPooling framework for a pooled architecture supporting up to 8 LTE cells in a pool.
 *               </li>
 *               <li>
 *                  Integrated with partner L2+ and validated End-2-End with TM500
 *               </li>
 *               <li>
 *                  First release validated on OVP6 (Virtualized Environment)
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based and Waddle Creek (POC FPGA)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: Ferry Bridge (POC FPGA) converting Packets to CPRI, Niantic NIC
 *               </li>
 *               <li>
 *                  <B>RRU</B>: Ace Axis
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, OVP6 (virtualization)
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler), DPDK 16.11
 *               </li>
 *             </ul>
 *            </p>
 *           </div>
 *         </div>
 *     </div>
 *     <div class="release_div release_div1">
 *         <div class="release_container">
 *           <b>&nbsp;1</b>
 *           <div class="release_date">Mar 2017</div>
 *         </div>
 *         <div class="release_content">
 *           <div class="release_version">Release 1.1</div>
 *           <div>
 *             <p>
 *               <ul>
 *               <li>
 *                  First LTE eNodeB release. Optimized SDK modules written using AVX2.
 *               </li>
 *               <li>
 *                  Pipeline was created using 2 threads. Max of 3 cells was supported
 *               </li>
 *               <li>
 *                  <B>CPU(s)</B>: Broadwell-D
 *               </li>
 *               <li>
 *                  <B>FEC Offload</B>: Software based and Waddle Creek (POC FPGA)
 *               </li>
 *               <li>
 *                  <B>Front Haul Offload</B>: None
 *               </li>
 *               <li>
 *                  <B>RRU</B>: None
 *               </li>
 *               <li>
 *                  <B>OS</B>: CentOS 7, OVP6 (virtualization)
 *               </li>
 *               <li>
 *                  <B>Other Software</B>: icc (Compiler)
 *               </li>
 *             </ul>
 *            </p>
 *          </div>
 *        </div>
 *     </div>
 *   </div>
 * \endhtmlonly
 * </DIV>
 */

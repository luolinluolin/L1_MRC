/*******************************************************************************
 *
 * <COPYRIGHT_TAG>
 *
 *******************************************************************************/

/**
 * @brief Doxygen File with Chapters and Sections
 * @file doxygen_head.c
 * @author Intel Corporation
 **/

//*****************************************************************************************************
// Chapters
//---------

/**
 * @mainpage Table of Contents
 *
 * <DIV style="text-align:justify; font-size:14px;">
 *
 * <OL class="mrcOlClass">
 *    <LI class="mrcUlLi">@ref ref_introduction</LI>
 *    <BR/>
 *    <LI class="mrcUlLi">@ref ref_flexran_release_history</LI>
 *    <BR/>
 *    <LI class="mrcUlLi">@ref ref_executive_summary
 *       <OL>
 *          <LI class="mrcUlLi">@ref ref_cycle_performance</LI>
 *          <LI class="mrcUlLi">@ref ref_wireless_performance</LI>
 *          <LI class="mrcUlLi">@ref ref_oran_mode_optimizations</LI>
 *       </OL>
 *    </LI>
 *    <BR/>
 *    <LI class="mrcUlLi">@ref ref_platforms_and_methodology
 *       <OL>
 *          <LI class="mrcUlLi">@ref ref_platforms</LI>
 *          <LI class="mrcUlLi">@ref ref_methodology
 *             <OL>
 *                <LI class="mrcUlLi">@ref ref_different_methdology</LI>
 *             </OL>
 *          </LI>
 *          <LI class="mrcUlLi">@ref ref_task_breakdown</LI>
 *          <LI class="mrcUlLi">@ref ref_bbu_tasks</LI>
 *          <LI class="mrcUlLi">@ref ref_ebbu_pool</LI>
 *          <LI class="mrcUlLi">@ref ref_oran_tests</LI>
 *          <LI class="mrcUlLi">@ref ref_methodology
 *             <OL>
 *                 <LI class="mrcUlLi">@ref ref_oran_tests_scope</LI>
 *             </OL>
 *          </LI>
 *       </OL>
 *    </LI>
 *    <BR/>
 *    <LI class="mrcUlLi">Historical Changes
 *        <OL>
 *            <LI class="mrcUlLi">@ref ref_code_changes</LI>
 *            <LI class="mrcUlLi">@ref ref_performance_changes</LI>
 *        </OL>
 *    </LI>
 *    <BR/>
 *    <LI class="mrcUlLi">Test Case Definition
 *       <OL>
 *           <LI class="mrcUlLi">@ref ref_sub3_10mhz_tests</LI>
 *           <LI class="mrcUlLi">@ref ref_sub3_20mhz_tests</LI>
 *           <LI class="mrcUlLi">@ref ref_sub6_tests</LI>
 *           <LI class="mrcUlLi">@ref ref_sub6_mmimo_32x32_tests</LI>
 *           <LI class="mrcUlLi">@ref ref_sub6_mmimo_64x64_tests</LI>
 *           <LI class="mrcUlLi">@ref ref_mmwave_tests</LI>
 *           <LI class="mrcUlLi">@ref ref_multi_numerology_20mhz_tests</LI>
 *       </OL>
 *    </LI>
 *    <BR/>
 *    <LI class="mrcUlLi">Cycle Count Performance Data
 *       <OL>
 *           <LI class="mrcUlLi">SDK Tests
 *               <OL>
 *                   <LI class="mrcUlLi">@ref ref_clxsp_sdk</LI>
 *                   <LI class="mrcUlLi">@ref ref_icxsp_sdk</LI>
 *                   <LI class="mrcUlLi">@ref ref_icxd_sdk</LI>
 *              </OL>
 *           </LI>
 *           <BR/>
 *           <LI class="mrcUlLi">PipeLine Tests
 *               <OL>
 *                   <LI>CascadeLake-SP
 *                       <OL>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_10mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub6_100mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_mmimo_100mhz_32x32</LI>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_mmimo_100mhz_64x64_8streams</LI>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_mmwave_100mhz_2x2</LI>
 *                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_multi_numerology</LI>
 *                           <BR/><BR/>
 *                           <LI class="mrcUlLi">Quarter to Quarter Change (v/s 21.11)
 *                               <OL>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_q2q_summary</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_10mhz_4x4_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub6_100mhz_4x4_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_mmimo_100mhz_32x32_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_mmimo_100mhz_64x64_8streams_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_mmwave_100mhz_2x2_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_multi_numerology_2203_vs_2207</LI>
 *                               </OL>
 *                           </LI>
 *                       </OL>
 *                   </LI>
 *                   <BR/>
 *                   <LI>IceLake-SP
 *                       <OL>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub3_10mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub3_20mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub6_100mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmimo_100mhz_32x32</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmimo_100mhz_64x64_8streams</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmimo_100mhz_64x64_16streams</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmwave_100mhz_2x2</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub3_20mhz_4x4_multi_numerology</LI>
 *                           <BR/><BR/>
 *                           <LI class="mrcUlLi">Quarter to Quarter Change (v/s 21.11)
 *                               <OL>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_q2q_summary</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub3_10mhz_4x4_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub3_20mhz_4x4_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub6_100mhz_4x4_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmimo_100mhz_32x32_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmimo_100mhz_64x64_8streams_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmimo_100mhz_64x64_16streams_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_mmwave_100mhz_2x2_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_acc100_sub3_20mhz_4x4_multi_numerology_2203_vs_2207</LI>
 *                               </OL>
 *                           </LI>
 *                       </OL>
 *                   </LI>
 *                   <BR/>
 *                   <LI>IceLake-D
 *                       <OL>
 *                           <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_sub6_100mhz_2x2</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_mmwave_100mhz_2x2</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_sub3_10mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_sub3_20mhz_4x4</LI>
 *                           <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_sub6_100mhz_4x4</LI>
 *                           <BR/><BR/>
 *                           <LI class="mrcUlLi">Quarter to Quarter Change (v/s 21.11)
 *                               <OL>
 *                                   <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_q2q_summary</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_sub6_100mhz_2x2_2203_vs_2207</LI>
 *                                   <LI class="mrcUlLi">@ref ref_icxd_hton_acc100_mmwave_100mhz_2x2_2203_vs_2207</LI>
 *                               </OL>
 *                           </LI>
 *                       </OL>
 *                   </LI>
 *                   <BR/>
 *                   <LI class="mrcUlLi">5GNR ORAN Mode tests
 *                       <OL>
 *                           <LI class="mrcUlLi">@ref ref_oran_mode_summary</LI>
 *                           <LI>Cascade-Lake with FortVille 2x25G NIC
 *                               <OL>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_10mhz_4x4_oran_cvl</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_oran_cvl</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub6_100mhz_4x4_oran_cvl</LI>
 *                                   <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_multi_numerology_oran_cvl</LI>
 *                                   <LI class="mrcUlLi">Quarter to Quarter Change (v/s 21.11)
 *                                       <OL>
 *                                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_10mhz_4x4_oran_cvl_2203_vs_2207</LI>
 *                                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_oran_cvl_2203_vs_2207</LI>
 *                                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub6_100mhz_4x4_oran_cvl_2203_vs_2207</LI>
 *                                           <LI class="mrcUlLi">@ref ref_clxsp_hton_acc100_sub3_20mhz_4x4_multi_numerology_oran_cvl_2203_vs_2207</LI>
 *                                       </OL>
 *                                   </LI>
 *                               </OL>
 *                           </LI>
 *                           <LI>Ice-Lake with ColumbiaVille 2x100G NIC
 *                               <OL>
 *                                   <LI class="mrcUlLi">@ref ref_icxsp_hton_mbc_mmimo_100mhz_32x32_oran_cvl</LI>
 *                                   <LI class="mrcUlLi">Quarter to Quarter Change (v/s 21.11)
 *                                       <OL>
 *                                           <LI class="mrcUlLi">@ref ref_icxsp_hton_mbc_mmimo_100mhz_32x32_oran_cvl_2203_vs_2207</LI>
 *                                       </OL>
 *                                   </LI>
 *                               </OL>
 *                           </LI>
 *                       </OL>
 *                   </LI>
 *               </OL>
 *           </LI>
 *       </OL>
 *    </LI>
 *    <BR/>
 *    <LI class="mrcUlLi">Wireless Perforamance Data
 *       <OL>
 *           <LI class="mrcUlLi">PUSCH
 *               <OL>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pusch_iclsp_iclsp_acc100_diff</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pusch_clxsp_n3000</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pusch_clxsp_acc100</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pusch_icxsp_acc100</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pusch_clxsp_soft_ldpc</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pusch_icxsp_soft_ldpc</LI>
 *               </OL>
 *           </LI>
 *           <LI class="mrcUlLi">PUCCH
 *               <OL>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pucch_spree_spree_vs_cslsp_diff</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pucch_spree</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pucch_clxsp</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_pucch_icxsp</LI>
 *               </OL>
 *           </LI>
 *           <LI class="mrcUlLi">PRACH
 *               <OL>
 *                   <LI class="mrcUlLi">@ref ref_wireless_prach_spree_spree_vs_cslsp_diff</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_prach_spree</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_prach_clxsp</LI>
 *                   <LI class="mrcUlLi">@ref ref_wireless_prach_icxsp</LI>
 *               </OL>
 *           </LI>
 *       </OL>
 *   </LI>
 * </OL>
 *
 * <BR/>
 * </DIV>
 */

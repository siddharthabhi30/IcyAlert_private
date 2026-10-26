Attributes {
    time {
        String bounds "time_bnds";
        String calendar "gregorian";
        String axis "T";
        String long_name "time";
        String standard_name "time";
        String units "days since 1850-01-01";
        UInt32 _ChunkSizes 1;
    }
    time_bnds {
        String units "days since 1850-01-01";
        UInt32 _ChunkSizes 1, 2;
    }
    j {
        String units "1";
        String long_name "cell index along second dimension";
    }
    i {
        String units "1";
        String long_name "cell index along first dimension";
    }
    latitude {
        String standard_name "latitude";
        String long_name "latitude";
        String units "degrees_north";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        String bounds "vertices_latitude";
        UInt32 _ChunkSizes 292, 362;
    }
    longitude {
        String standard_name "longitude";
        String long_name "longitude";
        String units "degrees_east";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        String bounds "vertices_longitude";
        UInt32 _ChunkSizes 292, 362;
    }
    vertices_latitude {
        String units "degrees_north";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 292, 362, 4;
    }
    vertices_longitude {
        String units "degrees_east";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 292, 362, 4;
    }
    type {
        String long_name "Sea Ice area type";
        String standard_name "area_type";
        DODS {
            Int32 strlen 7;
            String dimName "strlen";
        }
    }
    siconc {
        String standard_name "sea_ice_area_fraction";
        String long_name "Sea Ice Area Fraction (Ocean Grid)";
        String comment "Area fraction of grid cell covered by sea ice";
        String units "%";
        String original_name "siconc";
        String cell_methods "area: mean where sea time: mean";
        String cell_measures "area: areacello";
        String history "2019-07-02T10:07:22Z altered by CMOR: Treated scalar dimension: 'type'. 2019-07-02T10:07:22Z altered by CMOR: Reordered dimensions, original order: j i time.";
        String coordinates "type latitude longitude";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 1, 292, 362;
    }
    NC_GLOBAL {
        String Conventions "CF-1.7 CMIP-6.2";
        String activity_id "ScenarioMIP";
        Float64 branch_time 0.0;
        String contact "cmip6-data@ec-earth.org";
        String creation_date "2019-07-02T10:07:24Z";
        String data_specs_version "01.00.28";
        String experiment "update of RCP4.5 based on SSP2";
        String experiment_id "ssp245";
        String external_variables "areacello";
        Int32 forcing_index 1;
        String frequency "day";
        String further_info_url "https://furtherinfo.es-doc.org/CMIP6.EC-Earth-Consortium.EC-Earth3.ssp245.none.r12i1p1f1";
        String grid "ORCA1T255";
        String grid_label "gn";
        Int32 initialization_index 1;
        String institution "AEMET, Spain; BSC, Spain; CNR-ISAC, Italy; DMI, Denmark; ENEA, Italy; FMI, Finland; Geomar, Germany; ICHEC, Ireland; ICTP, Italy; IDL, Portugal; IMAU, The Netherlands; IPMA, Portugal; KIT, Karlsruhe, Germany; KNMI, The Netherlands; Lund University, Sweden; Met Eireann, Ireland; NLeSC, The Netherlands; NTNU, Norway; Oxford University, UK; surfSARA, The Netherlands; SMHI, Sweden; Stockholm University, Sweden; Unite ASTR, Belgium; University College Dublin, Ireland; University of Bergen, Norway; University of Copenhagen, Denmark; University of Helsinki, Finland; University of Santiago de Compostela, Spain; Uppsala University, Sweden; Utrecht University, The Netherlands; Vrije Universiteit Amsterdam, the Netherlands; Wageningen University, The Netherlands. Mailing address: EC-Earth consortium, Rossby Center, Swedish Meteorological and Hydrological Institute/SMHI, SE-601 76 Norrkoping, Sweden";
        String institution_id "EC-Earth-Consortium";
        String mip_era "CMIP6";
        String parent_activity_id "CMIP";
        String parent_experiment_id "historical";
        String parent_mip_era "CMIP6";
        String parent_source_id "EC-Earth3";
        String parent_sub_experiment_id "no parent";
        String parent_time_units "days since 1850-01-01";
        Int32 physics_index 1;
        String product "model-output";
        Int32 realization_index 12;
        String realm "seaIce";
        String source "EC-Earth3 (2019): 
aerosol: none
atmos: IFS cy36r4 (TL255, linearly reduced Gaussian grid equivalent to 512 x 256 longitude/latitude; 91 levels; top level 0.01 hPa)
atmosChem: none
land: HTESSEL (land surface scheme built in IFS)
landIce: none
ocean: NEMO3.6 (ORCA1 tripolar primarily 1 deg with meridional refinement down to 1/3 degree in the tropics; 362 x 292 longitude/latitude; 75 levels; top grid cell 0-1 m)
ocnBgchem: none
seaIce: LIM3";
        String source_id "EC-Earth3";
        String source_type "AOGCM";
        String sub_experiment "none";
        String sub_experiment_id "none";
        String table_id "SIday";
        String table_info "Creation Date:(06 November 2018) MD5:b2dc68c38656de0e72d665d82e3c038c";
        String title "EC-Earth3 output prepared for CMIP6";
        String variable_id "siconc";
        String variant_info "forcing: Nat.Ant. Member generated from autosubmit member fc0";
        String variant_label "r12i1p1f1";
        String license "CMIP6 model data produced by EC-Earth-Consortium is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License (https://creativecommons.org/licenses). Consult https://pcmdi.llnl.gov/CMIP6/TermsOfUse for terms of use governing CMIP6 output, including citation requirements and proper acknowledgment. Further information about this data, including some limitations, can be found via the further_info_url (recorded as a global attribute in this file) . The data producers and data providers make no warranty, either express or implied, including, but not limited to, warranties of merchantability and fitness for a particular purpose. All liabilities arising from the supply of the information (including any liability arising in negligence) are excluded to the fullest extent permitted by law.";
        String cmor_version "3.4.0";
        String nominal_resolution "100 km";
        String branch_method "standard";
        Float64 branch_time_in_parent 60265.0;
        Float64 branch_time_in_child 60265.0;
        String parent_variant_label "r1i1p1f1";
        String tracking_id "hdl:21.14100/22c45a76-4cc6-43c0-896f-571db5d45d71";
        String history "Wed Oct  2 22:09:07 2019: ncatted -O -a branch_time_in_child,global,m,c,60265. ./EC-Earth-Consortium/EC-Earth3/ssp245/r12i1p1f1/SIday/siconc/gn/v20190312/siconc_SIday_EC-Earth3_ssp245_r12i1p1f1_gn_20760101-20761231.nc
Wed Oct  2 22:09:06 2019: ncatted -O -a branch_time_in_parent,global,m,c,60265. ./EC-Earth-Consortium/EC-Earth3/ssp245/r12i1p1f1/SIday/siconc/gn/v20190312/siconc_SIday_EC-Earth3_ssp245_r12i1p1f1_gn_20760101-20761231.nc
Wed Oct  2 22:09:06 2019: ncatted -O -a branch_method,global,m,c,standard ./EC-Earth-Consortium/EC-Earth3/ssp245/r12i1p1f1/SIday/siconc/gn/v20190312/siconc_SIday_EC-Earth3_ssp245_r12i1p1f1_gn_20760101-20761231.nc
Fri Sep  6 21:14:28 2019: ncatted -O -a nominal_resolution,global,m,c,100 km ./ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp245/r12i1p1f1/SIday/siconc/gn/v20190312/siconc_SIday_EC-Earth3_ssp245_r12i1p1f1_gn_20760101-20761231.nc
Wed Sep  4 06:24:26 2019: ncatted -O -a nominal_resolution,global,m,c,100km ./ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp245/r12i1p1f1/SIday/siconc/gn/v20190312/siconc_SIday_EC-Earth3_ssp245_r12i1p1f1_gn_20760101-20761231.nc
2019-07-02T10:05:12Z ; CMOR rewrote data to be consistent with CMIP6, CF-1.7 CMIP-6.2 and CF standards.;
processed by ece2cmor v{version}, git rev.The cmor-fixer version v1.0 script has been applied.The cmor-fixer version v3.0 script has been applied.";
        String latest_applied_cmor_fixer_version "v3.0";
    }
    DODS_EXTRA {
        String Unlimited_Dimension "time";
    }
}

Attributes {
    time {
        String bounds "time_bnds";
        String units "days since 1850-01-01 0:0:0.0";
        String calendar "365_day";
        String axis "T";
        String long_name "time";
        String standard_name "time";
        UInt32 _ChunkSizes 1;
    }
    time_bnds {
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
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        String bounds "vertices_latitude";
        UInt32 _ChunkSizes 291, 360;
    }
    longitude {
        String standard_name "longitude";
        String long_name "longitude";
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        String bounds "vertices_longitude";
        UInt32 _ChunkSizes 291, 360;
    }
    vertices_latitude {
        String units "degrees_north";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 291, 360, 2;
    }
    vertices_longitude {
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 291, 360, 2;
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
        String long_name "Sea-ice Area Percentage (Ocean Grid)";
        String comment "Area fraction of grid cell covered by sea ice";
        String units "%";
        String original_name "siconc";
        String history "mltby100_ocn 2019-05-01T16:10:20Z altered by CMOR: Treated scalar dimension: 'type'.";
        String cell_methods "area: mean where sea time: mean";
        String cell_measures "area: areacello";
        String coordinates "type latitude longitude";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 1, 291, 360;
    }
    NC_GLOBAL {
        String CCCma_model_hash "24718c8346665b218729640ffe79d263b76456c4";
        String CCCma_parent_runid "rc3.1-his09";
        String CCCma_pycmor_hash "33c30511acc319a98240633965a04ca99c26427e";
        String CCCma_runid "rc3.1-s2609";
        String Conventions "CF-1.7 CMIP-6.2";
        String YMDH_branch_time_in_child "2015:01:01:00";
        String YMDH_branch_time_in_parent "2015:01:01:00";
        String activity_id "ScenarioMIP";
        String branch_method "Spin-up documentation";
        Float64 branch_time_in_child 60225.0;
        Float64 branch_time_in_parent 60225.0;
        String contact "ec.cccma.info-info.ccmac.ec@canada.ca";
        String creation_date "2019-05-01T16:10:20Z";
        String data_specs_version "01.00.29";
        String experiment "update of RCP2.6 based on SSP1";
        String experiment_id "ssp126";
        String external_variables "areacello";
        Int32 forcing_index 1;
        String frequency "day";
        String further_info_url "https://furtherinfo.es-doc.org/CMIP6.CCCma.CanESM5.ssp126.none.r9i1p1f1";
        String grid "ORCA1 tripolar grid, 1 deg with refinement to 1/3 deg within 20 degrees of the equator; 361 x 290 longitude/latitude; 45 vertical levels; top grid cell 0-6.19 m";
        String grid_label "gn";
        String history "2019-05-01T16:10:20Z ;rewrote data to be consistent with ScenarioMIP for variable siconc found in table SIday.;
Output from $runid";
        Int32 initialization_index 1;
        String institution "Canadian Centre for Climate Modelling and Analysis, Environment and Climate Change Canada, Victoria, BC V8P 5C2, Canada";
        String institution_id "CCCma";
        String mip_era "CMIP6";
        String nominal_resolution "100 km";
        String parent_activity_id "CMIP";
        String parent_experiment_id "historical";
        String parent_mip_era "CMIP6";
        String parent_source_id "CanESM5";
        String parent_time_units "days since 1850-01-01 0:0:0.0";
        String parent_variant_label "r9i1p1f1";
        Int32 physics_index 1;
        String product "model-output";
        Int32 realization_index 9;
        String realm "seaIce";
        String references "Geophysical Model Development Special issue on CanESM5 (https://www.geosci-model-dev.net/special_issues.html)";
        String source "CanESM5 (2019): 
aerosol: interactive
atmos: CanAM5 (T63L49 native atmosphere, T63 Linear Gaussian Grid; 128 x 64 longitude/latitude; 49 levels; top level 1 hPa)
atmosChem: specified oxidants for aerosols
land: CLASS3.6/CTEM1.2
landIce: specified ice sheets
ocean: NEMO3.4.1 (ORCA1 tripolar grid, 1 deg with refinement to 1/3 deg within 20 degrees of the equator; 361 x 290 longitude/latitude; 45 vertical levels; top grid cell 0-6.19 m)
ocnBgchem: Canadian Model of Ocean Carbon (CMOC); NPZD ecosystem with OMIP prescribed carbonate chemistry
seaIce: LIM2";
        String source_id "CanESM5";
        String source_type "AOGCM";
        String sub_experiment "none";
        String sub_experiment_id "none";
        String table_id "SIday";
        String table_info "Creation Date:(20 February 2019) MD5:374fbe5a2bcca535c40f7f23da271e49";
        String title "CanESM5 output prepared for CMIP6";
        String variable_id "siconc";
        String variant_label "r9i1p1f1";
        String version "v20190429";
        String license "CMIP6 model data produced by The Government of Canada (Canadian Centre for Climate Modelling and Analysis, Environment and Climate Change Canada) is licensed under a Creative Commons Attribution ShareAlike 4.0 International License (https://creativecommons.org/licenses). Consult https://pcmdi.llnl.gov/CMIP6/TermsOfUse for terms of use governing CMIP6 output, including citation requirements and proper acknowledgment. Further information about this data, including some limitations, can be found via the further_info_url (recorded as a global attribute in this file) and at https:///pcmdi.llnl.gov/. The data producers and data providers make no warranty, either express or implied, including, but not limited to, warranties of merchantability and fitness for a particular purpose. All liabilities arising from the supply of the information (including any liability arising in negligence) are excluded to the fullest extent permitted by law.";
        String cmor_version "3.4.0";
        String tracking_id "hdl:21.14100/581d5f5f-1bad-416b-bd38-be73eae9b214";
    }
    DODS_EXTRA {
        String Unlimited_Dimension "time";
    }
}

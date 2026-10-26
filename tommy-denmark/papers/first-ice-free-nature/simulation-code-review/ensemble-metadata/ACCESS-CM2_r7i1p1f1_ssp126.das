Attributes {
    time {
        String bounds "time_bnds";
        String units "days since 1850-01-01";
        String calendar "proleptic_gregorian";
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
        UInt32 _ChunkSizes 300, 360;
    }
    longitude {
        String standard_name "longitude";
        String long_name "longitude";
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        String bounds "vertices_longitude";
        UInt32 _ChunkSizes 300, 360;
    }
    vertices_latitude {
        String units "degrees_north";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 300, 360, 2;
    }
    vertices_longitude {
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 300, 360, 2;
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
        String long_name "Sea-Ice Area Percentage (Ocean Grid)";
        String comment "Percentage of grid cell covered by sea ice";
        String units "%";
        String original_units "1";
        String history "2023-10-17T11:28:26Z altered by CMOR: Converted units from '1' to '%'. 2023-10-17T11:28:26Z altered by CMOR: Treated scalar dimension: 'type'. 2023-10-17T11:28:26Z altered by CMOR: replaced missing value flag (1e+30) with standard missing value (1e+20).";
        String cell_methods "area: mean where sea time: mean";
        String cell_measures "area: areacello";
        String coordinates "type latitude longitude";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 1, 300, 360;
    }
    NC_GLOBAL {
        String Conventions "CF-1.7 CMIP-6.2";
        String activity_id "ScenarioMIP";
        String branch_method "standard";
        Float64 branch_time_in_child 60265.0;
        Float64 branch_time_in_parent 60265.0;
        String contact "access_csiro@csiro.au";
        String creation_date "2023-10-17T11:28:26Z";
        String data_specs_version "01.00.30";
        String experiment "update of RCP2.6 based on SSP1";
        String experiment_id "ssp126";
        String external_variables "areacello";
        Int32 forcing_index 1;
        String frequency "day";
        String further_info_url "https://furtherinfo.es-doc.org/CMIP6.CSIRO-ARCCSS.ACCESS-CM2.ssp126.none.r7i1p1f1";
        String grid "native atmosphere N96 grid (144x192 latxlon)";
        String grid_label "gn";
        String history "2023-10-17T11:28:26Z ; CMOR rewrote data to be consistent with CMIP6, CF-1.7 CMIP-6.2 and CF standards.";
        Int32 initialization_index 1;
        String institution "CSIRO (Commonwealth Scientific and Industrial Research Organisation, Aspendale, Victoria 3195, Australia), ARCCSS (Australian Research Council Centre of Excellence for Climate System Science)";
        String institution_id "CSIRO-ARCCSS";
        String mip_era "CMIP6";
        String nominal_resolution "250 km";
        String notes "Local exp ID: cx874; Variable: siconc (['aice'])";
        String parent_activity_id "CMIP";
        String parent_experiment_id "historical";
        String parent_mip_era "CMIP6";
        String parent_source_id "ACCESS-CM2";
        String parent_time_units "days since 1850-01-01";
        String parent_variant_label "r7i1p1f1";
        Int32 physics_index 1;
        String product "model-output";
        Int32 realization_index 7;
        String realm "seaIce";
        String run_variant "forcing: GHG, Oz, SA, Sl, Vl, BC, OC, (GHG = CO2, N2O, CH4, CFC11, CFC12, CFC113, HCFC22, HFC125, HFC134a)";
        String source "ACCESS-CM2 (2019): 
aerosol: UKCA-GLOMAP-mode
atmos: MetUM-HadGEM3-GA7.1 (N96; 192 x 144 longitude/latitude; 85 levels; top level 85 km)
atmosChem: none
land: CABLE2.5
landIce: none
ocean: ACCESS-OM2 (GFDL-MOM5, tripolar primarily 1deg; 360 x 300 longitude/latitude; 50 levels; top grid cell 0-10 m)
ocnBgchem: none
seaIce: CICE5.1.2 (same grid as ocean)";
        String source_id "ACCESS-CM2";
        String source_type "AOGCM";
        String sub_experiment "none";
        String sub_experiment_id "none";
        String table_id "SIday";
        String table_info "Creation Date:(30 April 2019) MD5:12ec21eb48eb992c2e353382c1c903b1";
        String title "ACCESS-CM2 output prepared for CMIP6";
        String variable_id "siconc";
        String variant_label "r7i1p1f1";
        String version "v20231017";
        String license "CMIP6 model data produced by CSIRO is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License (https://creativecommons.org/licenses/). Consult https://pcmdi.llnl.gov/CMIP6/TermsOfUse for terms of use governing CMIP6 output, including citation requirements and proper acknowledgment.  Further information about this data, including some limitations, can be found via the further_info_url (recorded as a global attribute in this file). The data producers and data providers make no warranty, either express or implied, including, but not limited to, warranties of merchantability and fitness for a particular purpose. All liabilities arising from the supply of the information (including any liability arising in negligence) are excluded to the fullest extent permitted by law.";
        String cmor_version "3.4.0";
        String tracking_id "hdl:21.14100/8f64023e-ef45-4721-afe8-247001ddd9a0";
    }
    DODS_EXTRA {
        String Unlimited_Dimension "time";
    }
}

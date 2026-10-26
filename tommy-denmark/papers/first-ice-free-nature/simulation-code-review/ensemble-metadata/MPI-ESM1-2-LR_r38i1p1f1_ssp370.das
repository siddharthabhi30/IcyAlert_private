Attributes {
    time {
        String bounds "time_bnds";
        String units "days since 1850-1-1 00:00:00";
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
        UInt32 _ChunkSizes 220, 256;
    }
    longitude {
        String standard_name "longitude";
        String long_name "longitude";
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        String bounds "vertices_longitude";
        UInt32 _ChunkSizes 220, 256;
    }
    vertices_latitude {
        String units "degrees_north";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 220, 256, 4;
    }
    vertices_longitude {
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 220, 256, 4;
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
        String original_name "siconc";
        String original_units "1";
        String history "2023-12-04T13:30:41Z altered by CMOR: Converted units from '1' to '%'. 2023-12-04T13:30:41Z altered by CMOR: Treated scalar dimension: 'type'. 2023-12-04T13:30:41Z altered by CMOR: replaced missing value flag (-9e+33) and corresponding data with standard missing value (1e+20).";
        String cell_methods "area: mean where sea time: mean";
        String cell_measures "area: areacello";
        String coordinates "type latitude longitude";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 1, 220, 256;
    }
    NC_GLOBAL {
        String CDO "Climate Data Operators version 2.2.0 (https://mpimet.mpg.de/cdo)";
        String Conventions "CF-1.7 CMIP-6.2";
        String activity_id "ScenarioMIP AerChemMIP";
        String branch_method "standard";
        Float64 branch_time_in_child 60265.0;
        Float64 branch_time_in_parent 60265.0;
        String contact "cmip6-mpi-esm@dkrz.de";
        String creation_date "2023-12-04T13:30:41Z";
        String data_specs_version "01.00.31";
        String experiment "gap-filling scenario reaching 7.0 based on SSP3";
        String experiment_id "ssp370";
        String external_variables "areacello";
        Int32 forcing_index 1;
        String frequency "day";
        String further_info_url "https://furtherinfo.es-doc.org/CMIP6.MPI-M.MPI-ESM1-2-LR.ssp370.none.r38i1p1f1";
        String grid "gn";
        String grid_label "gn";
        String history "2023-12-04T13:30:41Z ; CMOR rewrote data to be consistent with CMIP6, CF-1.7 CMIP-6.2 and CF standards.";
        Int32 initialization_index 1;
        String institution "Max Planck Institute for Meteorology, Hamburg 20146, Germany";
        String institution_id "MPI-M";
        String mip_era "CMIP6";
        String nominal_resolution "250 km";
        String parent_activity_id "CMIP";
        String parent_experiment_id "historical";
        String parent_mip_era "CMIP6";
        String parent_source_id "MPI-ESM1-2-LR";
        String parent_time_units "days since 1850-1-1 00:00:00";
        String parent_variant_label "r38i1p1f1";
        Int32 physics_index 1;
        String product "model-output";
        String project_id "CMIP6";
        Int32 realization_index 38;
        String realm "seaIce";
        String references "MPI-ESM: Mauritsen, T. et al. (2019), Developments in the MPI‐M Earth System Model version 1.2 (MPI‐ESM1.2) and Its Response to Increasing CO2, J. Adv. Model. Earth Syst.,11, 998-1038, doi:10.1029/2018MS001400,
Mueller, W.A. et al. (2018): A high‐resolution version of the Max Planck Institute Earth System Model MPI‐ESM1.2‐HR. J. Adv. Model. EarthSyst.,10,1383–1413, doi:10.1029/2017MS001217";
        String source "MPI-ESM1.2-LR (2017): 
aerosol: none, prescribed MACv2-SP
atmos: ECHAM6.3 (spectral T63; 192 x 96 longitude/latitude; 47 levels; top level 0.01 hPa)
atmosChem: none
land: JSBACH3.20
landIce: none/prescribed
ocean: MPIOM1.63 (bipolar GR1.5, approximately 1.5deg; 256 x 220 longitude/latitude; 40 levels; top grid cell 0-12 m)
ocnBgchem: HAMOCC6
seaIce: unnamed (thermodynamic (Semtner zero-layer) dynamic (Hibler 79) sea ice model)";
        String source_id "MPI-ESM1-2-LR";
        String source_type "AOGCM BGC";
        String sub_experiment "none";
        String sub_experiment_id "none";
        String table_id "SIday";
        String table_info "Creation Date:(24 July 2019) MD5:fbce031ab3359de3a9e31b5a0a02f5b3";
        String title "MPI-ESM1-2-LR output prepared for CMIP6";
        String variable_id "siconc";
        String variant_label "r38i1p1f1";
        String license "CMIP6 model data produced by MPI-M is licensed under a Creative Commons Attribution ShareAlike 4.0 International License (https://creativecommons.org/licenses). Consult https://pcmdi.llnl.gov/CMIP6/TermsOfUse for terms of use governing CMIP6 output, including citation requirements and proper acknowledgment. Further information about this data, including some limitations, can be found via the further_info_url (recorded as a global attribute in this file) and. The data producers and data providers make no warranty, either express or implied, including, but not limited to, warranties of merchantability and fitness for a particular purpose. All liabilities arising from the supply of the information (including any liability arising in negligence) are excluded to the fullest extent permitted by law.";
        String cmor_version "3.6.0";
        String tracking_id "hdl:21.14100/2bfeb974-aca2-48b1-8fa8-dc90e62956d1";
    }
    DODS_EXTRA {
        String Unlimited_Dimension "time";
    }
}

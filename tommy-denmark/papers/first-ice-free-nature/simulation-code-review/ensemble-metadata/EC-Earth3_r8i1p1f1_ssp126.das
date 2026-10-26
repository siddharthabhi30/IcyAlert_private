Attributes {
    time {
        String bounds "time_bnds";
        String units "days since 1850-01-01 00:00:00";
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
        String long_name "second spatial index for variables stored on an unstructured grid";
    }
    i {
        String units "1";
        String long_name "first spatial index for variables stored on an unstructured grid";
    }
    latitude {
        String standard_name "latitude";
        String long_name "latitude";
        String units "degrees_north";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        String bounds "vertices_latitude";
        UInt32 _ChunkSizes 292, 362;
    }
    longitude {
        String standard_name "longitude";
        String long_name "longitude";
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        String bounds "vertices_longitude";
        UInt32 _ChunkSizes 292, 362;
    }
    vertices_latitude {
        String units "degrees_north";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 292, 362, 2;
    }
    vertices_longitude {
        String units "degrees_east";
        Float64 missing_value 1.0E20;
        Float64 _FillValue 1.0E20;
        UInt32 _ChunkSizes 292, 362, 2;
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
        String cell_methods "area: mean where sea time: mean";
        String cell_measures "area: areacello";
        String history "2021-05-25T04:15:57Z altered by CMOR: Treated scalar dimension: 'type'. 2021-05-25T04:15:57Z altered by CMOR: Reordered dimensions, original order: j i time.";
        String coordinates "type latitude longitude";
        Float32 missing_value 1.0E20;
        Float32 _FillValue 1.0E20;
        UInt32 _ChunkSizes 1, 292, 362;
    }
    NC_GLOBAL {
        String Conventions "CF-1.7 CMIP-6.2";
        String activity_id "ScenarioMIP";
        String branch_method "standard";
        String contact "cmip6-data@ec-earth.org";
        String creation_date "2021-05-25T04:16:04Z";
        String data_specs_version "01.00.33";
        String ece2cmor_git_revision "fec0f6bc2aaf280dcb87fd8f45cf4848c16b6642";
        String experiment "update of RCP2.6 based on SSP1";
        String experiment_id "ssp126";
        String external_variables "areacello";
        Int32 forcing_index 1;
        String frequency "day";
        String further_info_url "https://furtherinfo.es-doc.org/CMIP6.EC-Earth-Consortium.EC-Earth3.ssp126.none.r8i1p1f1";
        String grid "ORCA1L75";
        String grid_label "gn";
        Int32 initialization_index 1;
        String institution "AEMET, Spain; BSC, Spain; CNR-ISAC, Italy; DMI, Denmark; ENEA, Italy; FMI, Finland; Geomar, Germany; ICHEC, Ireland; ICTP, Italy; IDL, Portugal; IMAU, The Netherlands; IPMA, Portugal; KIT, Karlsruhe, Germany; KNMI, The Netherlands; Lund University, Sweden; Met Eireann, Ireland; NLeSC, The Netherlands; NTNU, Norway; Oxford University, UK; surfSARA, The Netherlands; SMHI, Sweden; Stockholm University, Sweden; Unite ASTR, Belgium; University College Dublin, Ireland; University of Bergen, Norway; University of Copenhagen, Denmark; University of Helsinki, Finland; University of Santiago de Compostela, Spain; Uppsala University, Sweden; Utrecht University, The Netherlands; Vrije Universiteit Amsterdam, the Netherlands; Wageningen University, The Netherlands. Mailing address: EC-Earth consortium, Rossby Center, Swedish Meteorological and Hydrological Institute/SMHI, SE-601 76 Norrkoping, Sweden";
        String institution_id "EC-Earth-Consortium";
        String latest_applied_cmor_fixer_version "None";
        String latest_ece2cmor_version "v1.7.0";
        String mip_era "CMIP6";
        String nominal_resolution "100 km";
        String parent_activity_id "CMIP";
        String parent_experiment_id "historical";
        String parent_mip_era "CMIP6";
        String parent_source_id "EC-Earth3";
        String parent_time_units "days since 1850-01-01";
        String parent_variant_label "r8i1p1f1";
        Int32 physics_index 1;
        String product "model-output";
        Int32 realization_index 8;
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
        String table_info "Creation Date:(18 November 2020) MD5:4cee79e8d87199903c42a3cd96e09472";
        String title "EC-Earth3 output prepared for CMIP6";
        String tracking_id "hdl:21.14100/34123b29-b84f-4f3e-839c-1cbf93829d32";
        String variable_id "siconc";
        String variant_label "r8i1p1f1";
        String license "CMIP6 model data produced by EC-Earth-Consortium is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License (https://creativecommons.org/licenses). Consult https://pcmdi.llnl.gov/CMIP6/TermsOfUse for terms of use governing CMIP6 output, including citation requirements and proper acknowledgment. Further information about this data, including some limitations, can be found via the further_info_url (recorded as a global attribute in this file) and at http://www.ec-earth.org. The data producers and data providers make no warranty, either express or implied, including, but not limited to, warranties of merchantability and fitness for a particular purpose. All liabilities arising from the supply of the information (including any liability arising in negligence) are excluded to the fullest extent permitted by law.";
        String cmor_version "3.5.0";
        Float64 branch_time_in_parent 60265.0;
        Float64 branch_time_in_child 60265.0;
        String history "Thu Nov 11 17:01:05 2021: ncatted -a branch_time_in_child,global,m,d,60265. ds12/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp126/r8i1p1f1/SIday/siconc/gn/v20210615/siconc_SIday_EC-Earth3_ssp126_r8i1p1f1_gn_20620101-20621231.nc
Thu Nov 11 17:01:05 2021: ncatted -a branch_time_in_parent,global,m,d,60265. ds12/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp126/r8i1p1f1/SIday/siconc/gn/v20210615/siconc_SIday_EC-Earth3_ssp126_r8i1p1f1_gn_20620101-20621231.nc
2021-05-25T04:15:36Z ; CMOR rewrote data to be consistent with CMIP6, CF-1.7 CMIP-6.2 and CF standards.;
processed by ece2cmor v1.7.0, git rev. fec0f6bc2aaf280dcb87fd8f45cf4848c16b6642
";
        String NCO "netCDF Operators version 4.8.1 (Homepage = http://nco.sf.net, Code = http://github.com/nco/nco)";
    }
    DODS_EXTRA {
        String Unlimited_Dimension "time";
    }
}

### NGS and PCR data need to be matched properly and one result will validate the other and vice-versa. Considering this, how do you
  * _avoid matching errors?_
    * A unique identifier (i.e., sample barcode) should be generated in a systematic way and controlled in a centralized system (i.e., LIMS) to keep the integrity in mapping between the samples and associated data. A nomenclature is required for automation (e.g., APL_platform_sample_date_001) and a barcode allows researchers to trace every sample at the patient level. For example, a technician who will perform whole-genome sequencing in a sample must request a barcode by typing in a piece of patient information on LIMS. Then, the LIMS returns a barcode that can be annotated to the given sample.
  * _provide feedback to the user regarding successful and unsuccessful matches?_  
    * If a missing barcode found, researchers could trace who requested a barcode from the LIMS and should be able to map the NGS and PCR datasets.

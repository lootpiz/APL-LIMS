### After data matching, a report must be generated, which has to be accessible from anywhere in the laboratory. Also, data needs to be moved to a long term storage. Based on this
 * _How do you deliver your reports?_
   * Clinical reports (i.e., ISO20428) will be generated automatically on a cluster and will be linked to the APL-LIMS whether a clinically actionable mutation has been reported. Then, the APL-LIMS will notify clinicians and bioinformaticians to check the reports and they will visit the APL-LIMS, where a secure login system is implemented.

 * _How do you know if the analysis passed QA/QC and then can be moved to the storage?_
   * Along with the clinical reports, diagnostic plots generated in QC process will be available on the same page on the APL-LIMS. The APL-LIMS also provides a symbol in different colors (i.e., red or green) to show the statuses/results of the processing whether there was problematic data.

 * _Long term storage is in another network hub (not in the lab intranet) which is also protected by the same firewall. What would be your preferred method to transfer data? Would be manual or automated transfer?_
   * Once clinicians and bioinformaticians confirmed the clinical and other reports, raw and processed data can be automatically transferred to an archiving system that can be triggered by the APL-LIMS via Rsync. Once sync is done, the APL-LIMS will notify bioinformaticians to delete files on the cluster. This process will be done manually.

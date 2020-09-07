### One day, the clinically validated PCR machine breaks and now the data will be generated in another room in the same lab.

 * _Do you need to re-validate your software?_
   * Yes, a system-level integration requires a validation/testing to avoid bugs in the software.

 * _If so, what would be best approach?_
   * First, a bioinformatician needs to confirm whether a new machine generates the same output in terms of its format/structure. By executing a test run on the new machine, a bioinformatician should confirm the actual datasets are successfully transferred and stored in the cluster to keep the integrity on LIMS. Because the LIMS system is a wrapper software, it requires to check whether the actual files exist.
 
 * _You need to transfer your software to the new desktop machine, or not?_
   * My software runs on a cluster and provides an interface for researchers to upload their files securely. Therefore, it is not necessary to transfer the software to the new machine.

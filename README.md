# Software for Skin detection by dual maximization of detectors agreement for video monitoring

## Overview 
This software implements a method to detect skin in images that adapts to the content of each dataset. Adaptation is based on the agreement maximization framework, whose aim is to find the configuration with the highest similarity between two independent thresholding- based detectors applied to colour channels.


Check out the [project site](http://www-vpu.eps.uam.es/publications/SkinDetDM) for all the details like:
- [Sample results](http://www-vpu.ii.uam.es/publications/SkinDetDM/#results)
- [Datasets and Ground-truth](http://www-vpu.eps.uam.es/publications/SkinDetDM/#dataset)

## License and Citation

 This software is released under the [Academic Public License](https://github.com/vpulab/trackquality-arte/blob/master/TrackerCondition/LICENSE).).

Please cite the following publication if this software helps your research:


    @article{sanmiguel2012TIP,
      Author = {J. SanMiguel and S. Suja},
      Journal = {Pattern Recognition Letters},
      Title = {Skin detection by dual maximization of detectors agreement for video monitoring},
      Year = {2013},
      number = {34},
      issue = {16},
      pages = {2102–2109},
      Month = {Dec}
    }
    

## Requirements

This tool was successfully tested under MS Windows (32-bit and 64-bit) and linux (32-bit) for versions 2012b and 2013a. It requires the MATLAB image processing toolbox.

## Using the code

For using the code, two demo scripts are provided:
- **train_skin_models.m**: analyses colour spaces using training data and generates the models to be
used by the proposed SDDMA approach. If new models want to be trained for the dataset, please
follow the same structure (subdirs ‘ann’ and ‘raw’) and annotation of skin data using red colour.
Then add a new line of the script with the details of the new dataset. The output of this function is
stored in the directory ‘models’ (*.mat and *.fig files for each dataset). Textual summary is also show
during the process. Use help command to get more information about the functions used within the
script.

- **test_skin_detection.m**: calls the SDDMA method that implements the paper to analyse a particular
dataset. It uses the mat files generated with the previous script. Two types of models can be used:
global and local (ie, specific to a dataset). Local models provide better results as the optimum
channel selection is more accurate. Image and text output results are saved in the directory
indicated when calling the ‘sddma’ function. Use help command to get more information about the
functions used within the script.

## Contact information
If you have any queries, please contact juancarlos.sanmiguel@uam.es.
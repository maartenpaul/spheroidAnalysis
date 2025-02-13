import os
import random
import shutil

def collect_random_images(root_dir, output_dir, num_images=2):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for folder in os.listdir(root_dir):
        folder_path = os.path.join(root_dir, folder)
        if os.path.isdir(folder_path):
            for subfolder in os.listdir(folder_path):
                subfolder_path = os.path.join(folder_path, subfolder)
                if os.path.isdir(subfolder_path):
                    # Modified to exclude files starting with 'label'
                    tif_files = [f for f in os.listdir(subfolder_path) 
                               if f.lower().endswith('.tif') and 
                               not f.lower().startswith('label')]
                    
                    if tif_files:  # Check if there are any files after filtering
                        selected_images = random.sample(tif_files, min(num_images, len(tif_files)))

                        for image in selected_images:
                            src_path = os.path.join(subfolder_path, image)
                            new_filename = f"{folder}_{subfolder}_{image}"
                            new_filename = new_filename.replace(' ', '_')  # Replace spaces with underscores
                            dst_path = os.path.join(output_dir, new_filename)
                            shutil.copy2(src_path, dst_path)
                            print(f"Copied: {src_path} -> {dst_path}")
                    else:
                        print(f"No eligible .tif files found in: {subfolder_path}")

if __name__ == "__main__":
    root_directory = "path/to/your/root/directory"  # Replace with your actual root directory
    output_directory = "path/to/your/output/directory"  # Replace with your desired output directory
    collect_random_images(root_directory, output_directory)

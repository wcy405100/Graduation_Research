import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;


public class Create_txt{
	
	public static void main(String[] args) throws IOException{
		

		System.out.println("Current Working Directory = "+ 
			System.getProperty("user.dir"));
		System.out.println("Please put the image folder under current directory!");

		Scanner in = new Scanner(System.in);  
		System.out.println("Input the wanted folder name: "); // input 'frames' or 'flow_image'
		String folder = in.nextLine();
		String folder_dir = System.getProperty("user.dir")+ "/" + folder;
		
		File infolder = new File(folder_dir);

		//System.out.println(infolder.getPath());
		
		if (infolder.isDirectory())
		{	
			for (String category : infolder.list()){
				String cate_dir = folder_dir+"/" + category;
				String cate_txt = category + ".txt" ;
				if (folder.equals("flow_images")){
					cate_txt = "flow_"+cate_txt;
				}
				File cat_folder = new File(cate_dir);
				String[] subfolders = cat_folder.list();
				File txt_file = new File(System.getProperty("user.dir"),cate_txt);
				BufferedWriter txt = new BufferedWriter(new FileWriter(txt_file));
				String cate = "0";
				if (category.equals("eagle")){
					cate = "1";
				}
				
				for(String name : subfolders)
				{
					String subf_dir = cate_dir + "/" + name;
					File sub_folder = new File(subf_dir);
					File[] imglist = sub_folder.listFiles();
					for (int i=0;i<imglist.length;i++){
						String img_dir = category+"/"+name+"/"+imglist[i].getName()+" "+cate;
						txt.write(img_dir);
						txt.newLine();
					}	
				}
				txt.close();
			}
			System.out.println("Create txt, finished!");			
		}
		else
		{
			System.out.println("Not found the wanted folder!");
		}

	}

}


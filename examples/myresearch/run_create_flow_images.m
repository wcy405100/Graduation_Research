function run_create_flow_images()
	% frames/ is the main directory we will read into
	% flow_images is the main directory we will write to
	
	mlist=clean_dir('frames/');
	sav_root='flow_images/';
  
  if ~isdir(sav_root)
    mkdir(sav_root)
  end

	for ind=1:length(mlist)
		r_dir = sprintf('frames/%s',mlist{ind});
		w_dir = sprintf('flow_images/%s',mlist{ind});
		fprintf('Dealing with the %d_th folder in %s\n',ind,r_dir)  
		create_flow_images_LRCN(r_dir,w_dir);
	end
	
	function files = clean_dir(base)
	  %clean_dir just runs dir and eliminates files in a foldr
	  files = dir(base);
	  files_tmp = {};
	  for i = 1:length(files)
	    if strncmpi(files(i).name, '.',1) == 0
	      files_tmp{length(files_tmp)+1} = files(i).name;
	      %fprintf('Filename: %s.\n',files_tmp{length(files_tmp)});
	    end
	  end
	  files = files_tmp;

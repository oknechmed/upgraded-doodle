for file in ./templates/epel*
do
	#sed -i "s/download.fedoraproject.org/localhost:2002/" $file
	#sed -i "s/mirrors.fedoraproject.org/localhost:2012/" $file
	#sed -i "s/#baseurl=/baseurl=/" $file
	sed -i "s/metalink=/#metalink=/ " $file
	#mv $file $file.j2
done

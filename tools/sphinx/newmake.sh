#sphinx-build: the following arguments are required: sourcedir, outputdir, filenames
SPHINXBUILD=sphinx-build
SOURCEDIR=doc
echo "target directory will be docs, under gerber_writer. includes .nojekyll"
BUILDDIR=docs

# change to project directory. -- return to current dir after execution of this script.
while true ; do
	if [[ $PWD = "/" ]]; then
		echo "we could not find the project directory gerber_writer"
		exit 
	fi
#    echo "base=$(basename $PWD) on path $PWD"
    if [[ "$(basename $PWD)" =~ "gerber_writer" ]]; then
        break
    fi
    cd ..
done

rm -rf docs

if [ -z "$1" ]
then
  echo "\nargument missing. we will use  html\n"
  $SPHINXBUILD -M html $SOURCEDIR $BUILDDIR $SPHINXOPTS $0
else
  $SPHINXBUILD -M $1 $SOURCEDIR $BUILDDIR $SPHINXOPTS $O
fi

touch docs/.nojekyll
touch docs/html/.nojekyll

echo "\npush to https://github.com/Karel-Tavernier/gerber_writer.git"
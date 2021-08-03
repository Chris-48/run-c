infile=$1
outfile=$2

RED='\033[0;31m'
NC='\033[0m'

ERROR="${RED}ERROR${NC}:"

# In case the input file doesn't exit thow an error.
if [ ! -f "$infile" ]
then
    printf "$ERROR '$infile' doesn't exist in the current directory."
    exit
fi

# If no file output name was specified assing output file to input file.
if [ -z "$outfile" ]
then
    outfile=${infile%.*}
fi

case $infile in
    # Use g++ to compile if the input file has the C++/C extention.
    *".cc" | *".cpp" | *".c")
        g++ $infile -o $outfile
        ;;
    # Throw an error if the extention is not supported.
    *)
        printf "$ERROR file extention not suported."
        exit
        ;;
esac

# Execute
./$outfile.exe
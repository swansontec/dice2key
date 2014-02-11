# Converts a sequence of dice rolls to a Bitcoin private key.
#
# Simply roll a standard 6-sided die 100 times, and pass the resulting
# numbers into the script.
#
# I am placing this work in the public domain.

# Collapse the command-line parameters into one massive number:
dice=0$(echo $* | tr -d [:space:] | tr 1-6 0-5)

if [ ${#dice} -lt 100 ]; then
    echo "warning: The input has less than 100 dice rolls"
fi

# Convert from base 6 to base 16. The eval fixes line-breaking in the output.
eval "hex=$(dc -e16o6i${dice}p)"

# Print the last 64 hex digits of the output:
echo $hex | sed -e 's/.*\(.\{64\}\)$/\1/'

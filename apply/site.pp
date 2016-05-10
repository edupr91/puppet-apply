# Run stages for initial and final changes, before/after the implicit 'main'
stage { [ 'first', 'last' ]: }
Stage['first'] -> Stage['main'] -> Stage['last']

# Resources to be put in the INITIAL run stage
Yumrepo { stage => 'first' }

# Silence annoying warning with puppet 3.6.2
Package { allow_virtual => true }


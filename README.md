# Overview

The main `apply/` directory contains the Puppet Manifests to apply, but some
others are also present inside `custom/` to be temporarily moved or copied to
the `apply/` directory.

It is also possible to simulate an ENC by copy/pasting YAML to `apply.yaml`,
which will be used instead of the Manifests when `classes` are present there.

Feel free to add your own custom manifests or YAML as `custom/<modulename>.pp`
or `custom/<modulename>.yaml` with useful test cases. Do not commit/push
manifest changes in `apply/` or `apply.yaml`!

# Environments

## Testing, Pre-Production and Production

Make sure you are authorized to install git and make changes to the server(s)
you will be working on.

# Preparing

```bash
which git || yum -y install git
git clone --recursive git@github.com:edupr91/puppet-apply.git
cd puppet-apply
```

# Running

 * Dry run : `./papply --noop`
 * Real run : `./papply`
 * Debug run : `./papply --debug`
 * Apply custom YAML: `./papply --yaml custom/<module>.yaml`

# Testing Facts

All custom facts will automatically be used by the `papply` runs, but if you
need to test changes to the facts from a single module, use the following :

```bash
export FACTERLIB=${PWD}/modules/<yourmodulename>/lib/facter
facter -p
```


#! /usr/bin/env bash

TWOPENCE_COMMAND="twopence_command"

setup_local()
{
	if [[ ! -x $(which ${TWOPENCE_COMMAND}) ]];
	then

	fi
}

setup_remote()
{
	local host=$1
	tp $host "if [[ \$(grep -c "SLES_HPC" /etc/os-release) -lt "1" ]]; then echo "you need to install SLES HPC"; exit; fi"
	tp $host "if [[ \$(zypper lr | grep -c SLE-Module-DevTools15) -lt "1" ]]; then echo "you need to enable SLE-Module-DevTools15 module"; exit; fi
#	zypper ar -p 150 http://download.suse.de/ibs/SUSE:/Factory:/Head/standard factory
	tp $host "zypper ar -p 150 https://download.opensuse.org/repositories/science:/HPC/SLE_15/ science_HPC"
	tp $host "zypper ref science_HPC"
	tp $host "zypper in fabtests"
}

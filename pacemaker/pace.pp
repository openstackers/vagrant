class {"pacemaker::corosync":
#  manage_fw => false,
  cluster_name => "cluster_test",
  cluster_members => "one.pcs.tst two.pcs.tst three.pcs.tst",
  cluster_setup_extras => { '--ipv6' => '' },
}

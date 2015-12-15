class {"pacemaker::corosync":
#  manage_fw => false,
  cluster_name => "cluster_test",
  cluster_members => "one.xyz.tst two.xyz.tst three.xyz.tst",
  cluster_setup_extras => { '--ipv6' => '' },
}

stage { pre: before => Stage[main] }
stage { post: require => Stage[main] }
class passwordsafe {
      # this gets mocked out
}

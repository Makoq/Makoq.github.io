{% if page.comments && theme.gitalk.enable %}
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
  <script src="https://rawgit.com/qhh0205/78e9e0b1f3114db6737f3ed8cdd51d3a/raw/3894c5be5aa2378336b1f5ee0f296fa0b22d06e9/md5.min.js"></script>
   <script type="text/javascript">
        var gitalk = new Gitalk({
          clientID: '3840ba8c8d80c18be7e3',
          clientSecret: '1b00f2efe5285973c24da9ed9ac895775eacc8ea',
          repo: '{{ theme.gitalk.repo }}',
          owner: '{{ theme.gitalk.githubID }}',
          admin: ['{{ theme.gitalk.adminUser }}'],
          id: md5(location.pathname),
          distractionFreeMode: '{{ theme.gitalk.distractionFreeMode }}'
        })
        gitalk.render('gitalk-container')
    </script>
{% endif %}
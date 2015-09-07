use Mojolicious::Lite;

plugin 'RevealJS';

any '/' => 'presentation';

app->start;

__DATA__

@@ presentation.html.ep

% layout 'revealjs';

%= stylesheet begin
  .no-uc { text-transform: none !important; }
% end

<section>
  <h1 class="no-uc">Module::Build</h1>
  <h2>And The "Classic" Build Systems</h2>
  <h3>Joel Berger</h3>
</section>

<section>
  <h2>In the beginning there was <span class="no-uc">ExtUtils::MakeMaker</span></h2>
  <ul>
    <li>Generates a Makefile for use by make(1)<ul>
      <li>Requires external tooling</li>
      <li>Requires knowledge of make (and some insane Perl) in order to extend</li>
    </ul></li>
    <li>Mentioned here for completeness</li>
  </ul>
</section>

<section>
  <h3>Why use <span class="no-uc">make(1)</span> when we have a glue language already?</h3>
</section>

<section>
  <h2>And then there was <span class="no-uc">Module::Build</span></h2>
  <ul>
    <li>Common usage much like EUMM</li>
    <li>No need for external tools!</li>
    <li>Easy to extend by subclassing<ul>
      <li>I am the author of a few on CPAN, including Alien::Base::ModuleBuild
    </ul></li>
  </ul>
</section>

<section>
  <h2>So how does it work?</h2>
</section>

<section>
  <h2>The <span class="no-uc">Build.PL</span> file</h2>
  %= include_code 'ex/Build.PL'
</section>

<section>
  <section>
    <h2>Using the script</h2>
    <pre><code class="bash">
# prepare release
$ perl Build.PL
$ perl Build manifest
$ perl Build test
$ perl Build dist
$ perl Build distcheck
$ perl Build disttest
# release
$ perl Build realclean
    </code></pre>
  </section>

  <section>
    <h2>Using the script (extended)</h2>
    <pre><code class="bash">
$ perl-reversion -bump # from Perl::Version
$ podselect path/to/main.pm > README.pod
$ perl Build.PL
$ perl Build manifest
$ perl Build test
$ perl Build dist
$ perl Build distcheck
$ perl Build disttest
$ mojo cpanify -u JBERGER -p PASSWORD my-dist.tar.gz
$ perl Build realclean
    </code></pre>
  </section>
</section>

<section>
  <h2>Recommendations</h2>
  <ul>
    <li>Don't keep meta or manifest files in VCS</li>
    <li>Do keep MANIFEST.SKIP and .gitignore in VCS</li>
    <li>Include README.pod in MANIFEST.SKIP</li>
    <li>Good templates for MANIFEST.SKIP and .gitignore are easily available</li>
  </ul>
</section>

<section>
  <h2>Dispelling some misconceptions</h2>
  <ul>
    <li>Module::Build is NOT deprecated!</li>
    <li>Removal from the core is primarily because it can be<ul>
      <li>meta files can specify configure requirements</li>
      <li>modern build chains know how to handle those requirements</li>
    </ul></li>
  </ul>
</section>

<section>
  <h2>Final Thoughts</h2>
  <ul>
    <li>Although some people see this process as "too manual"</li>
    <li>It's good to know the underlying system</li>
    <li>You control the process, not some black-box plugin</li>
    <li><em>Much easier for contributors to step in quickly</em></li>
  </ul>
</section>

<section>
  <h2 class="no-uc">Module::Build::Tiny</h2>
  <ul>
    <li>A minimal reimplentation of the build-phase parts of Module::Build</li>
    <li>REALLY spartan</li>
    <li>Mostly for use by author tool like Dist::Zilla ... or ...</li>
  </ul>
</section>

<section>
  <h2 class="no-uc">App::ModuleBuildTiny</h2>
  <ul>
    <li>A minimal author tool, companion to MBT</li>
    <li>Still fairly spartan and opinionated, but useful</li>
    <li>Perhaps not quite enough/ready for beginners</li>
  </ul>
</section>


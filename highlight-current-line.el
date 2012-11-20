<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: highlight-current-line.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=highlight-current-line.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: highlight-current-line.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=highlight-current-line.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for highlight-current-line.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=highlight-current-line.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22highlight-current-line.el%22">highlight-current-line.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="download/highlight-current-line.el">Download</a></p><pre class="code"><span class="linecomment">;;; highlight-current-line.el --- highlight line where the cursor is.</span>

<span class="linecomment">;; Copyright (c) 1997-2003 Christoph Conrad Time-stamp: &lt;19.09.2003 20:10:05&gt;</span>

<span class="linecomment">;; Author: Christoph Conrad &lt;Christoph.Conrad@gmx&gt;</span>
<span class="linecomment">;; Created: 10 Oct 1997</span>
<span class="linecomment">;; Version: 0.57</span>
<span class="linecomment">;; Keywords: faces</span>

<span class="linecomment">;; This file is not yet part of any Emacs.</span>

<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License along</span>
<span class="linecomment">;; with this program; if not, write to the Free Software Foundation, Inc.,</span>
<span class="linecomment">;; 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.</span>
 
<span class="linecomment">;;; Commentary:</span>

<span class="linecomment">;; Minor mode to highlight the line the cursor is in. You can change colors</span>
<span class="linecomment">;; of foreground (text) and background. The default behaviour is to set</span>
<span class="linecomment">;; only a background color, so that font-lock fontification colors remain</span>
<span class="linecomment">;; visible (syntax coloring). Enable a buffer using the command</span>
<span class="linecomment">;; `highlight-current-line-minor-mode' and customize via:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   M-x customize-group highlight-current-line &lt;RET&gt;.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can select whether the whole line (from left to right window border)</span>
<span class="linecomment">;; is marked or only the really filled parts of the line (from left window</span>
<span class="linecomment">;; border to the last char in the line). The second behaviour is suitable</span>
<span class="linecomment">;; if it's important for you to see trailing spaces or tabs in a</span>
<span class="linecomment">;; line. Customize the variable `highlight-current-line-whole-line' (or use</span>
<span class="linecomment">;; the function `highlight-current-line-whole-line-on' retained for</span>
<span class="linecomment">;; compatibility with prior versions).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You may enable the minor-mode automatically for (almost) all buffers by</span>
<span class="linecomment">;; customizing the variable `highlight-current-line-globally' (or using the</span>
<span class="linecomment">;; compatibility command `highlight-current-line-on').  Buffers whose</span>
<span class="linecomment">;; buffer-name match the regular expression in the customizable variable</span>
<span class="linecomment">;; `highlight-current-line-ignore-regexp' do not highlighted.  You can</span>
<span class="linecomment">;; extend or redefine this regexp. This works together with the default</span>
<span class="linecomment">;; ignore function `highlight-current-line-ignore-function'. You can</span>
<span class="linecomment">;; redefine this function to implement your own criterias.</span>

<span class="linecomment">;; (The functions `highlight-current-line-on',</span>
<span class="linecomment">;; `highlight-current-line-set-fg-color' and</span>
<span class="linecomment">;; `highlight-current-line-set-bg-color' are retained for backward</span>
<span class="linecomment">;; compatibility. There's a special color "none" defined to set no color.)</span>

 
<span class="linecomment">;;; People which made contributions or suggestions:</span>

<span class="linecomment">;; This list is ordered by time. Latest in time first.</span>
<span class="linecomment">;; - Peter S Galbraith   &lt;psg@debian.org&gt;</span>
<span class="linecomment">;; - Masatake Yamato     &lt;jet@gyve.org&gt;</span>
<span class="linecomment">;; - Hrvoje Niksic	 &lt;hniksic@srce.hr&gt;</span>
<span class="linecomment">;; - Jari Aalto		 &lt;jari.aalto@ntc.nokia.com&gt;</span>
<span class="linecomment">;; - Shawn Ostermann     &lt;sdo@picard.cs.OhioU.Edu&gt;</span>
<span class="linecomment">;; - Peter Ikier	 &lt;p_ikier@infoac.rmi.de&gt;</span>
<span class="linecomment">;;   Many thanks to him for the idea. He liked this behaviour in another</span>
<span class="linecomment">;;   editor ("Q").</span>
 
<span class="linecomment">;;; Installation:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Put a copy of highlight-current-line.el/.elc into some path of</span>
<span class="linecomment">;; `load-path'. To show `load-path': &lt;C-h v&gt; load-path RET</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Load the file, e.g. add in ~/.emacs</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  (require 'highlight-current-line)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Enable it on a buffer using `M-x highlight-current-line-minor-mode'</span>
<span class="linecomment">;; or globally by customizing `highlight-current-line-globally'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Previous versions of this code worked by adding other comamnds in</span>
<span class="linecomment">;; ~/.emacs instead of using the custom interface.  This is still</span>
<span class="linecomment">;; supported:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ;; If you want to mark only to the end of line:</span>
<span class="linecomment">;;  (highlight-current-line-whole-line-on nil)</span>
<span class="linecomment">;;  ;; switch highlighting on</span>
<span class="linecomment">;;  (highlight-current-line-on t)</span>
<span class="linecomment">;;  ;; Ignore no buffer</span>
<span class="linecomment">;;  (setq highlight-current-line-ignore-regexp nil) ; or set to ""</span>
<span class="linecomment">;;  ;; alternate way to ignore no buffers</span>
<span class="linecomment">;;  (fmakunbound 'highlight-current-line-ignore-function)</span>
<span class="linecomment">;;  ;; Ignore more buffers</span>
<span class="linecomment">;;  (setq highlight-current-line-ignore-regexp</span>
<span class="linecomment">;;       (concat "Dilberts-Buffer\\|"</span>
<span class="linecomment">;;	       highlight-current-line-ignore-regexp))</span>
 
<span class="linecomment">;;; Troubleshooting:</span>

<span class="linecomment">;; - Q: I do not see matching parens from paren.el any more!</span>
<span class="linecomment">;; - A: Check the colors from highlight-current-line or from show-paren-face</span>
<span class="linecomment">;;   and choose some combination which works together.</span>
 
<span class="linecomment">;;; ToDo:</span>

<span class="linecomment">;; - highlight paragraphs, functions etc... (suggestion by Daniel Lundin</span>
<span class="linecomment">;;   &lt;daniel@emacs.org&gt; 19 Dec 1999)</span>
<span class="linecomment">;; - provide overlay priorities</span>
<span class="linecomment">;;   (overlay-put highlight-current-line-overlay 'priority 60)</span>
<span class="linecomment">;; - better way to switch off 'ignore buffer'</span>
<span class="linecomment">;; - face fore/backgroundcolor depending on major-mode</span>
<span class="linecomment">;; - better way to detect xemacs</span>

<span class="linecomment">;; - some suggestions for default keys</span>
<span class="linecomment">;; - highlight-current-line as minor mode. Suggested by Shawn Ostermann.</span>
 
<span class="linecomment">;;; Change log:</span>

<span class="linecomment">;; 10 Sept 2003 - v0.57 &lt;psg@debian.org&gt;</span>
<span class="linecomment">;; - highlight-current-line-minor-mode created.</span>
<span class="linecomment">;; - highlight-current-line-globally defcustom added.</span>

<span class="linecomment">;; 7 Sept 2003 - v0.56</span>
<span class="linecomment">;; - defface for highlight-current-line-face with customization.</span>
<span class="linecomment">;;   Thanks to Peter S. Galbraith for the suggestion. Retained</span>
<span class="linecomment">;;   highlight-current-line-set-fg/bg-color for backward</span>
<span class="linecomment">;;   compatibility.</span>

<span class="linecomment">;; 7 Sept 2003 - v0.55</span>
<span class="linecomment">;; - v0.54 change works now correctly</span>

<span class="linecomment">;; 22 Mar 2003 - v0.54</span>
<span class="linecomment">;; - don't highlight lines which contain faces specified in</span>
<span class="linecomment">;;   highlight-current-line-high-faces. Elisp manual: "Currently, all</span>
<span class="linecomment">;;   overlays take priority over text properties." So, if a text</span>
<span class="linecomment">;;   property is a face, highlight-current-line always hides that face.</span>

<span class="linecomment">;; 12 Mar 2002 - v0.53</span>
<span class="linecomment">;; - updated email address</span>

<span class="linecomment">;; 05 Feb 2001</span>
<span class="linecomment">;; - highlight-current-line-ignore-regexp: better regexp for minibuffers</span>

<span class="linecomment">;; 15 Jul 2000 - v0.52:</span>
<span class="linecomment">;; - Masatake YAMATO: added emacsclient / gnudoit support. Invoking emacs</span>
<span class="linecomment">;;   to load a file from external, highlight-current-line couldn't</span>
<span class="linecomment">;;   initially show the line of the loaded file highlighted.</span>

<span class="linecomment">;; 19 Oct 1997 - v0.51:</span>
<span class="linecomment">;; - uses defcustom-library if available. Suggested by Jari Aalto and Hrvoje</span>
<span class="linecomment">;;   Niksic.</span>
<span class="linecomment">;; - logic error in if-condition of post-command-hook. All Buffers were</span>
<span class="linecomment">;;   ignored if highlight-current-line-ignore-function was unbound.</span>

<span class="linecomment">;; 18 Oct 1997 - v0.5:</span>
<span class="linecomment">;; - GNU General Public License</span>
<span class="linecomment">;; - ignore user-definable buffernames which are ignored for</span>
<span class="linecomment">;;   highlighting. Suggested by Jari Aalto.</span>
<span class="linecomment">;; - works with XEmacs, at least version 19.15. Mark whole line doesnt work</span>
<span class="linecomment">;;   yet. Suggested by Jari Aalto.</span>
<span class="linecomment">;; - highlight-current-line-set-fg/bg-color understand "none" as color</span>
<span class="linecomment">;; - overlay-put moved from post-command-hook to initialization-code</span>
<span class="linecomment">;; - version-variable: `highlight-current-line-version'. Always</span>
<span class="linecomment">;;   "major.minor". Suggested by Jari Aalto.</span>

<span class="linecomment">;; 11 Oct 1997 - v0.4:</span>
<span class="linecomment">;; - Possibility to highlight whole line (from left to right windowborder) or</span>
<span class="linecomment">;;   only from left window border to the last char in the line.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 20 Aug 1997 - v0.3:</span>
<span class="linecomment">;; - First public released version.</span>
 
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;; Initialization for XEmacs</span>

<span class="linecomment">;; XEmacs needs overlay emulation package.</span>
<span class="linecomment">;; Old XEmacs won't have the package and we must quit.</span>
(eval-and-compile
  (if (boundp 'xemacs-logo)
      (if (not (load "<span class="quote">overlay</span>" 'noerr))
	  (error "<span class="quote">\
highlight-current-line.el: ** This package requires overlays.  Abort</span>"))))

<span class="linecomment">;; Compatibility code - blob for those without the custom library:</span>
(eval-and-compile
  (condition-case ()
      (require 'custom)
    (error nil))
  (if (and (featurep 'custom) (fboundp 'custom-declare-variable))
      nil <span class="linecomment">;; We've got what we needed</span>
    <span class="linecomment">;; We have the old custom-library, hack around it!</span>
    (defmacro defgroup (&rest args)
      nil)
    (defmacro defcustom (var value doc &rest args)
      (` (defvar (, var) (, value) (, doc))))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; Variables</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; can be set by user</span>

(defgroup highlight-current-line nil
  "<span class="quote">Highlight line where the cursor is.</span>"
  :load 'highlight-current-line
  :group 'faces) <span class="linecomment">;; or 'matching??</span>

(defcustom highlight-current-line-ignore-regexp
  (concat
   "<span class="quote">Faces\\|Colors\\| \\*Mini</span>"
   <span class="linecomment">;; for example:</span>
   <span class="linecomment">;; "\\|RMAIL.*summary\\|\\*Group\\|\\*Summary"</span>
   )
  "<span class="quote">*Regexps for buffers to ignore.
Used by `highlight-current-line-ignore-function'.</span>"
  :type  'regexp
  :group 'highlight-current-line)

(defcustom highlight-current-line-whole-line t
  "<span class="quote">*If non-nil, mark up to `end-of-line'.  If nil, mark up to window-border.
Use `highlight-current-line-whole-line-on' to set this value.</span>"
  :type  'boolean
  :group 'highlight-current-line)

(defcustom highlight-current-line-high-faces '()
  "<span class="quote">*Lines containing one of this faces are not highlighted.</span>"
  :type  'list
  :group 'highlight-current-line)

(defface highlight-current-line-face
  '((t (:background "<span class="quote">wheat</span>")))
    "<span class="quote">Face used to highlight current line.</span>"
  :group 'highlight-current-line)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;; should not be set by user</span>

(defconst highlight-current-line-version "<span class="quote">0.57</span>"
  "<span class="quote">Version number.</span>" )

(defvar highlight-current-line-minor-mode nil
  "<span class="quote">Non-nil if using highlight-current-line mode as a minor mode.
Use the command `highlight-current-line-minor-mode' to toggle or set this
variable.</span>")
(make-variable-buffer-local 'highlight-current-line-minor-mode)

(defvar highlight-current-line-overlay
  <span class="linecomment">;; Dummy initialization</span>
  (make-overlay 1 1)
  "<span class="quote">Overlay for highlighting.</span>")

<span class="linecomment">;; Set face-property of overlay</span>
(overlay-put highlight-current-line-overlay
	     'face 'highlight-current-line-face)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;;; Functions</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;; Internal function for test</span>
(defun highlight-current-line-reload ()
  "<span class="quote">Reload library highlight-current-line for test purposes.</span>"
  (unload-feature 'highlight-current-line)
  (load-library "<span class="quote">highlight-current-line</span>"))

<span class="linecomment">;; Decide whether to highlight the buffer.</span>
(defun highlight-current-line-ignore-function  ()
  "<span class="quote">Check current buffer name against `highlight-current-line-ignore-regexp'.
Inhibits global enabling of highlight-current-line on buffer whose name
match this regexp.</span>"
  (if (or (equal "<span class="quote"></span>" highlight-current-line-ignore-regexp)
	  (not highlight-current-line-ignore-regexp))
      nil
    (string-match highlight-current-line-ignore-regexp (buffer-name))))

(defvar highlight-current-line-globally)

<span class="linecomment">;; Post-Command-Hook for highlighting</span>
(defun highlight-current-line-hook ()
  "<span class="quote">Post-Command-Hook for highlighting.</span>"
  (condition-case ()
      (if (or highlight-current-line-minor-mode
              (and highlight-current-line-globally
                   (or (not (fboundp 'highlight-current-line-ignore-function))
                       (not (highlight-current-line-ignore-function)))))
          (let ((current-point (point)))

            <span class="linecomment">;; Set overlay</span>
            (let ((beg (progn (beginning-of-line) (point)))
                  (end (progn (if highlight-current-line-whole-line
                                  (forward-line 1)
                                (end-of-line))
                              (point))))
              (if (delete nil (mapcar
                                 (lambda( face )
                                   (text-property-any beg end 'face face))
                                 highlight-current-line-high-faces))
                  (delete-overlay highlight-current-line-overlay)
                (move-overlay highlight-current-line-overlay
                              beg end (current-buffer)))

              (goto-char current-point))))
    (error nil)))

(defconst highlight-current-line-no-color (if (boundp 'xemacs-logo)
                                              '[]
                                            nil)
  "<span class="quote">'color' value that represents \"no color\".</span>")

<span class="linecomment">;; Compatibility code</span>
(defun highlight-current-line-on (&optional on-off)
  "<span class="quote">Switch highlighting of cursor-line on/off globally.
Key: \\[highlight-current-line-on]</span>"
  (interactive (list (y-or-n-p "<span class="quote">Highlight line with cursor? </span>")))
  (setq-default highlight-current-line-globally on-off)
  (highlight-current-line on-off nil))

<span class="linecomment">;; Compatibility code - Set foregroundcolor of cursor-line.</span>
(defun highlight-current-line-set-fg-color (color)
  "<span class="quote">Set foregroundcolor for highlighting cursor-line to COLOR.
Key: \\[highlight-current-line-set-fg-color]</span>"
  (interactive "<span class="quote">sForeground color (\"none\" means no color): </span>")
  (if (equal "<span class="quote">none</span>" color)
      (setq color highlight-current-line-no-color))
  (set-face-foreground 'highlight-current-line-face color))

<span class="linecomment">;; Compatibility code - Set backgroundcolor of cursor-line.</span>
(defun highlight-current-line-set-bg-color (color)
  "<span class="quote">Set backgroundcolor for highlighting cursor-line to COLOR.
Key: \\[highlight-current-line-set-bg-color]</span>"
  (interactive "<span class="quote">sBackground color (\"none\" means no color): </span>")
  (if (equal "<span class="quote">none</span>" color)
      (setq color highlight-current-line-no-color))
  (set-face-background 'highlight-current-line-face color))

<span class="linecomment">;; Compatibility code - Enable/Disable whole line marking</span>
(defun highlight-current-line-whole-line-on (&optional on-off)
  "<span class="quote">Switch highlighting of whole line ON-OFF.
Key: \\[highlight-current-line-whole-line-on]</span>"
  (interactive (list (y-or-n-p "<span class="quote">Highlight whole line? </span>")))
  (setq highlight-current-line-whole-line on-off))

<span class="linecomment">;; Enable/Disable Highlighting</span>
(defun highlight-current-line (&optional on-off local)
  "<span class="quote">Switch highlighting of cursor-line ON-OFF
If LOCAL is non-nil, do so locally for the current buffer only.</span>"
  (cond
   (on-off
    (if (or (= emacs-major-version 20)
            (string-match "<span class="quote">XEmacs</span>" emacs-version))
        (make-local-hook 'post-command-hook))
    (add-hook 'post-command-hook 'highlight-current-line-hook nil local)
    (if (boundp 'server-switch-hook)
        (add-hook 'server-switch-hook 'highlight-current-line-hook nil local))
    (if (boundp 'gnuserv-visit-hook)
        (add-hook 'gnuserv-visit-hook 'highlight-current-line-hook nil local)))
   (t
    (if  (boundp 'server-switch-hook)
        (remove-hook 'server-switch-hook 'highlight-current-line-hook local))
    (if (boundp 'gnuserv-visit-hook)
        (remove-hook 'gnuserv-visit-hook 'highlight-current-line-hook local))
    (remove-hook 'post-command-hook 'highlight-current-line-hook t)
    (delete-overlay highlight-current-line-overlay))))

<span class="linecomment">;;;###autoload</span>
(defun highlight-current-line-minor-mode (&optional arg)
  "<span class="quote">Toggle highlight-current-line minor mode.
With ARG, turn minor mode on if ARG is positive, off otherwise.
You can customize the face of the highlighted line and whether the entire
line is hightlighted by customizing the group highlight-current-line.</span>"
  (interactive "<span class="quote">P</span>")
  (setq highlight-current-line-minor-mode
        (if (null arg)
            (not highlight-current-line-minor-mode)
          (&gt; (prefix-numeric-value arg) 0)))
  (if highlight-current-line-minor-mode
      (highlight-current-line t t)
    (highlight-current-line nil t)))

(or (assq 'highlight-current-line-minor-mode minor-mode-alist)
    (setq minor-mode-alist
          (append minor-mode-alist
                  (list '(highlight-current-line-minor-mode "<span class="quote"> hcl</span>")))))

(defcustom highlight-current-line-globally nil
  "<span class="quote">*Whether to enable `highlight-current-line-minor-mode' automatically.
This affects only files visited after this variable is set.
Buffers will not be enabled if they match the regular expression in
`highlight-current-line-ignore-regexp'.</span>"
  :type  'boolean
  :require 'highlight-current-line
  :set (lambda (symbol value)
         (set-default symbol value)
         (if value
             (highlight-current-line t nil)
           (highlight-current-line nil nil)))
  :group 'highlight-current-line)

(provide 'highlight-current-line)

<span class="linecomment">;;; highlight-current-line.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=highlight-current-line.el;missing=de_en_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=highlight-current-line.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=highlight-current-line.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=highlight-current-line.el">Administration</a></span><span class="time"><br /> Last edited 2005-10-13 17:56 UTC by <a class="author" title="from 217-162-112-104.dclient.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=highlight-current-line.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>

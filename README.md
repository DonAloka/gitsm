<div id="top"></div>

[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">gitsm (Git Submodule Management)</h3>

  <p align="center">
    gitsm is a simple tool for managing git sub modules
    <br />
  </p>
</div>
<a href="https://asciinema.org/a/z236LVGbjSKwfh6gFZn5X7JSK" target="_blank"><img src="https://asciinema.org/a/z236LVGbjSKwfh6gFZn5X7JSK.svg" /></a>


<!-- ABOUT THE PROJECT -->
## About The Project

`gitsm` provides few functionalities to mange git submobules. A git submodule is just another git repository which has a parent repository. Essentially, what `gitsm` does is manage the commits between the sub modules and provide a mechanism to push those in a more streamlined approach. Behind the scenes a module’s .git file points to the part in it’s parent git directory that manages a specific module (.git/modules/<MODULE_PATH>). The submodule’s git data is actually managed by the parent repository. This way the main parent repository performs staging and commits for all submodules, and is aware of their states. With this setup you need to create a new commit in the parent repository to use in the git submodule. You need to repeat this procedure every time when you want to add a change in one of the submodules.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

Using bash scripting. Bash is a shell command language that’s used in Linux. In the realm of Linux, the shell is a command-line interpreter that provides a user interface for running commands.

* [bash scripting](https://www.gnu.org/software/bash/)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

In this section how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* git
  ```sh
  sudo apt-get update
  sudo apt-get install git
  git --version

  ```
* Should be on Linux or MACOS

### Execute

_Below section show  how you can instruct your audience on installing and setting up your program. This program doesn't rely on any external dependencies or services._

1. specify the relative path to the Bash script that we want to run
   ```sh
   chmod +x gitsm.sh
   ./commit.sh
   ```
2. Select the option(Enter the number 1/2/3/4)
    1) Represent the submodule commit side. 
    2) Represent the git status for you directory.
    3) Represent the Submodule Remove from you git repository
    4) Exit from the program
 
 ![Screenshot from 2022-04-20 12-26-27](https://user-images.githubusercontent.com/85221772/164168956-fc4fdce8-2135-4b43-ad61-1d02d1b0da30.png)
    
3. If you select the number 1, first give the submodule directory (example:- submarines/bomb) 
And type the commit message, to commit all submodules. 







<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://lk.linkedin.com/in/hiran-aloka-b3a8b721a

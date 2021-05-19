
# Master thesis structure draft v2

* Abstract
* Sammendrag
* Acknowledgements
* Introduction
  * NTNU, TDT4250, EMF in education, Eclipse IDE for EMF, shift from Eclipse to web with Theia/VSCode
  * Eclipse ecosystem is moving to the cloud, EMF.Cloud, GLSP, Theia, gitpod, Sprotty.
    * Pre-project identified that the main actors are Typefox, EclipseSource, RedHat, Obeo
    * Main focus on development, not the developer; code in Eclipse and run in cloud
  * The pre-project identified a need for a web-based tree editor to work with EMF. It suggested an architecture and design. The ecosystem is already working on graphical editors for EMF, as presented on EclipseCon2020.
    * Some early identified requirements:
      * EMF is big, we don't want to re-implement it. Focus on re-use of existing software
      * Open Source, to increase the chance of adoption and further improvement. The solution will require more work than a single semester.
      * Special needs for project management, because it must be maintained and improved over a longer period of time.
    * Functional requirements were extracted in pre-project from Eclipse IDE's EMF tree editors.
      * View models of different levels, from Ecore metamodel to model instances.
      * View model as a tree based on containment properties.
      * Create empty model files with the minimum file contents.
      * Edit model hierarchies by creating, deleting or moving tree nodes.
      * Edit tree node properties by using a form-based editor.
      * Saving model changes to xmi files.
      * Validation of models.
      * Generation of code from models.
    * Non-functional requirements from empirical evidence, to increase the chance of project adoption of the Eclipse ecosystem.
      * Flexibility - customize rendering and logic for different models.
      * Configurability - alter or toggle behavior per-project based on config files.
      * Conforming to existing architectures that are empirically validated, and familiar to the Eclipse ecosystem developers.
* Background
  * Conceptual modeling
  * TDT4250. Modeling, use of instances to validate model as you develop, validation of models.
  * Eclipse EMF offers different Ecore editors. Tree-editor is important for developers, and diagrams are important in runtime and end-users.
  * Master-detail Tree Editors. Brief introduction to Tree Structures.
  * Reflective Ecore Editor, its architecture, Commands in .Edit, works on any model.
  * Ecore metamodel, EMF, XMI, genmodel. Adaptation of editors to special cases like Ecore model and Genmodel.
  * VSCode Custom Editor API enables any type of graphical editor to be made, not just text.
  * LSP from VSCode solves language-to-editor m*n combinations. There is already a need to move EMF from Eclipse to VSCode, it might need to move to IntelliJ etc. in the future.
  * The pre-project suggested an architecture for a VSCode Extension based on LSP. It confirmed the feasibility of the client-server model with a custom editor, the major blockers for this architecture.
    * It also suggested a data structure for general purpose tree editing.
    * It suggested a base protocol on which to build the TLSP on, but did not implement it.
  * What can make this Open Source software project viable and worth pursuing further? Anecdotal and empirical evidence, not research.
    * This project needs to live on after the delivery of the Thesis.
    * Correct open source licenses, and "licence hygience" wrt. copy-pasting. Eclipse Foundation do thorough licence reviews.
    * Use of programming languages accepted by the developer community.
    * Use of automated build systems accepted by the developer community.
    * Testable code to reduce legacy and maintenance burden.
    * Human readable, clean code. Correct use of Design Patterns. Clean separation of concerns.
    * Use of commonly used and recognized dependencies/libraries/frameworks/tools.
    * CI/CD.
    * Good developer documentation. Architecture diagrams. Informative Readme-files with pictures of the running software. Instructions for developer environment setup.
    * Google Design Documents (?). Not too common in this ecosystem, but valuable inside Google. Complements the readme.
    * Publicly available bug/issue tracker and roadmap.
    * Release management. Semantic versioning. Changelogs. More useful for end-users or those using this as a library/dependency.
    * Specific to Eclipse Foundation, is the "Eclipse Foundation Project Handbook" (https://www.eclipse.org/projects/handbook/) and its checklist.
    * Measures to reduce new-developer onboarding and friction.
* Method
  * Design Science. Build and evaluate value. Contribute to knowledge base. Is this software we need?
  * Requirements engineering by extraction. Skip user testing for requirement validation. 
  * Source code inspection of similar projects. Use the same architecture, design patterns, build systems, software dependencies. Ensures familiarity for the ecosystem, and uses already empirically validated designs.
  * Agile planning. Avoid big upfront design and specification. Change plans as new discoveries become evident.
  * Lean development. Create a minimum viable product and see if it works.
  * Test driven development, where applicable. Verify behavior of critical logic, to reduce bugs and increase developer confidence and speed.
  * Tracer bullets. Reduce risk from integration by connecting all the major components, before developing any component fully.
  * Pre-project with prototyping. Reduce risk by testing feasibility early.
  * Iterative development. Work on one component at the time, up to a minimum level of functionality. Then come back later and add more.
* Results
  * Functioning viewer of any Ecore model in VSCode. Missing most features.
  * TLSP architecture. 3-component system (view, extension, server).
  * TLSP protocol. JSON-RPC based with LSP Base, with a Tree Document Model data structure. Hierarchy schemas for optimistic-view drag-n-drop. Type and id based nodes. 
  * Reuses java EMF code and EMF.Cloud ModelServer. No re-implementation of EMF logic.
  * A project that may be viable and further developed.
    * Bundled IDE configuration: recommended extension, build tasks, run configurations. Reduces overhead for new developers.
    * NOT: CI/CD. Easily added later when needed. Overhead for 1-man project.
    * Build-scripts and npm/maven for building.
    * Readme-files for all components and modules.
* Evaluation
  * Feature test based on Confluence tasks.
    * Result: missing many features still. Not usable in education.
  * Protocol-to-usecase parity. (Protocol-to-emfCommands parity?)
    * Result: JSON-RPC part is missing most features still. Not stable and recommended for adoption. The extension needs more features in order to grow the protocol. The data structure is valid; it can represent different tree structures from domains like Ecore, json and file systems.
  * Environment end-to-end test in gitpod.
    * Result: the extension can install and render Ecore diagrams.
  * Flexibility test to change the label or which properties are shown as children.
    * Result: failed. No such feature yet. No major blocker except development time.
  * Editor functionality test.
    * Result: Can view multiple trees and select nodes. Can show/hide children. Does not show correct icon. Missing drag-and-drop, editing, keyboard shortcuts, right click, keyboard navigation, validation.
  * Project viability test.
    * Result: has a good kernel. Missing issues and roadmap on github. Clean code, but many TODO/FIXME that are unresolved. 
* Discussion (did we ask the right questions? Can we believe the results?)
  * Uncertain if the LSP or GLSP has the best approach (many vs few procedures, action handler, message-relaying)
  * Some ideas of LSP are not carried on, like "capability querying". Is it needed? Agile says not yet (YAGNI).
  * Suggestions to how the protocol should look or be developed.
  * Is the method correct?
  * Can the evaluation be trusted?
  * Is a tree editor the correct thing to build? EMF adoption may be hindered by:
    * Bad or missing documentation+guides+examples
    * Missing genmodel towards web (typescript. cross-ecore tries to address this, but is not stable yet and not configurable with genmodel)
    * Generated Ecore java API is cumbersome, unintuitive, poorly documented, not fluent.
    * Ecore is too oriented towards Eclipse as the runtime, with Eclipse specific Design Patterns (Adapter, ItemProvider etc).
* Conclusion
* References
* Appendix


# Master thesis structure draft v1


no Front page. It is auto-generated by NTNU.

* Abstract
* Sammendrag
* Acknowledgements
* Introduction
  * Context
    * topic, purpose, relevance,
    * Stakeholders
  * What to expect from thesis
  * Project objectives (Scope)
    * What the solution will do
    * Research questions and objectives
    * How this software product will achieve the objectives
    * Software Project management
      * Agile development
      * Open source
        * Eclipse Foundation https://www.eclipse.org/projects/handbook/ 
  * Overview of thesis structure.
* Background
  * Design Science
    * Relevance, design, rigor
    * Build and evaluate
  * Agile
  * MDD and EMF
    * EMF libraries (validation, transaction) ?
    * EMF and Eclipse plugins
      * Editors (graphical, xml textual, tree)
      * Eclipse+plugin as a target/output for new workbench/editor
    * genmodel
    * Eclipse RCP (?)
  * Vscode and Theia
    * Theia Tree Editor
  * Gitpod, openvsx
  * Vscode custom editor
  * LSP and GLSP
  * EMFCloud model-server
  * Observed trends in modern development
    * Configurability
    * Json/js/ts configurations
    * CI/CD
    * Inversion of control / dependency injection
    * Static typing for code navigation and compile time validation
    * CLI applications (create-react-app, npx, vue-cli, prettier)
    * Lint (eslint, prettier)
    * Modularity (submodules, multiple packages) with layered architecture
    * Web technologies (html/css/ts, electron)
    * Thorough, online documentation with examples and guides
    * Publicly available issue tracker
    * Open Source
  * Architecture and quality
    * Based on existing projects. Empirical evidence
      * LSP: Likely more maintainable because more recognizable
  * Pre-project findings (?)
    * Feasibility of designs
    * Data structures
    * Choice of extension mechanisms
    * Base protocol
* Literature review (?)
  * Approach
    * Databases, queries
  * Results
    * LSP
    * Tree editors
  * Gaps in the literature
    * Protocol design for editors
    * Tree editor requirements
    * Feasibility and recommended design of such editors
* Method (Design science)
  * Software requirements identification (pre-project)
    * Literature review
    * EclipseCon (GLSP talks, and discussion with Helming)
    * Agile to avoid wasted upfront requirements analysis
    * Eclipse EMF editor analysis for requirement extraction
    * Open Source code inspection for design patterns, protocol design and software dependency suggestions
    * Prototyping for feasibility
      * Google-style Design documents for lean requirements spec
  * Software development
    * Agile
      * One sprint
      * Minimum viable product
      * Mini iterations: domain model, extension, frontend, backend, frontend-extension communication, extension-backend communication
    * Pragmatic programmer "tracer bullets"
    * Domain driven design inspired (but anemic and without aggregates etc.)
    * Tools (?)
      * Vscode, typescript, npm, intellij, java, maven, git, github
  * Software evaluation by Design Science
    * Evaluation of value
    * Analysis method
      * Confluence tasks for TDT4250
      * Feature completion analysis for general tree editor developers
      * Protocol scenario evaluation for usefulness
      * Re-useability and flexibility analysis for architecture evaluation
  * How to ensure rigour
    * Grounding in existing knowledge
      * Empirical evidence of existing protocol designs (Experience & expertise)
      * Realistic example Ecore model  
    * Addition of new knowledge
      * Evaluation of software product
      * Evaluation and applicability of resulting software architecture
* Results
  * Software environment components and context
  * Identified functional and non-functional requirements
  * Architecture and components
  * Open source analysis
    * VSCode extension examples
    * VSCode LSP protocol implementation
    * GLSP protocol implementation
    * EMF.Cloud ModelServer usage, software architecture
    * LSP4J protocol specification, json-rpc library
  * Implemented features
  * TLSP protocol design and the principles/values behind its design
  * Anemic domain models for tree documents
  * Acceptance test results on confluence EMF tasks
* Evaluation
  * Acceptance test success/failure
  * Value of solution to stakeholders
    * Value of editor
    * Value of protocol design
    * Value of tree editor for reuse
  * Research question answers
* Discussion
  * Findings wrt to research questions
  * Is the solution as good as assumed?
    * If the method was used correctly, the solution should be good.
  * Value of completing this work
  * Value of replacing EMF with something else
  * Value of sticking to Eclipse for EMF
  * Using ecore-glsp or Theia Tree Editor instead
    * Theia only
    * diagrams only, prefer trees for ecore. Anecdotal, is there research behind this?
    * Provide a generic tree editor for other vscode extensions
  * Choices made of the design of this solution
    * Self-made tree editor vs off-the-shelf library vs integrated tree viewer
    * VSCode or Theia-only
    * Generic or specialized JSON-RPC protocol
    * JSON-RPC vs REST for server
    * Why server instead of pure vscode-extension code
    * Shortcuts chosen
    * Major outstanding areas of work
      * EMF Forms
      * Context-menu
      * User-specified label logic
      * Dynamic server using end-user `.edit`-javacode
      * Validation
      * Code navigation (source-links (ala `myfile.java:86:3`), ctrl-click an element to go to its declaration)
      * Model analysis (`find usages`, `refactor/rename`)
      * Editor-creation (custom Theia, Eclipse+plugin)
      * Model debugging
      * Keyboard shortcuts
  * Amount of work required to complete this work. Is it justified? Is this worth pursuing?
  * Limitations, what can't the results answer?
    * If students would use a more finished extension
    * Of other vscode extensions would be made with a tree editor
    * If EMF itself could be replaced with something better
* Conclusion
  * Main research question answer
  * Main findings
  * What was not known before? Why does this research matter?
  * Further work
* References
* Appendix
  * Pre-project prototypes
    * https://github.com/krissrex/vscode-extension-backend-talker/blob/b7f2b98097f20ebe9f5e0ec2772eee34c1d225e9/design-doc.md
    * https://github.com/krissrex/vscode-extension-ecore-tree-editor/blob/e055ca25b336f828181d320a37fe61b5ffb785e4/design-doc.md
    * https://github.com/krissrex/dummy-process-communication
  * Pre-project text https://github.com/krissrex/ntnu-tdt4501-preproject-article/releases/tag/v0.1-29
  
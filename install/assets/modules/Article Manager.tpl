/**
 * Article Manager
 *
<<<<<<< HEAD
 * Article Manager Beta 2.4.8 - Manage Blog Posts and more
 *
 * @category	module
 * @version     Beta 2.4.8
=======
 * Article Manager Beta 2.4.7 - Manage Blog Posts and more
 *
 * @category	module
 * @version     Beta 2.4.7
>>>>>>> origin/master
 * @author      Author: Nicola Lambathakis http://www.tattoocms.it/
 * @internal	@modx_category Manager
 * @internal    @properties &ListSnippet= List Snippet:;list;Ditto,List,DocLister;Ditto &ArticleModuleTitle=Main Page Module Title:;string;Article Manager &ArticleModuleIcon=AwesomeFont icon:;string;fa-pencil &tablefields= Tv Fields:;string;[+pagetitle+],[+longtitle+],[+description+],[+date+],[+documentTags+] &tableheading=TV  heading:;string;Page Title,Long Title,Description,Date,Tags &ParentFolder=Parent folder:;string;0 &ListItems=Max items in List:;string;all &hideFolders= Hide Folders:;list;yes,no;yes &showPublishedOnly= Show Published Only:;list;yes,no;yes &dittolevel= Depht:;string;3 &ListBoxFilter= Enable filter:;list;yes,no;no &dittofilter= Filter:;string; &EnablePopup= Popup Editing:;list;no,yes;yes &editTitle=Editing Title:;string;Edit &EnablePreview= Preview Button:;list;no,yes;yes &previewTitle=Preview Title:;string;View &EnableNewResource= New Resource Button:;list;no,yes;yes &NewResourceTitle=New Resource Title:;string;Add New + &CreateResourceHereTitle=Create Resource  Title:;string;Create Resource &EnableCreateLinks= Create Links Button:;list;no,yes;yes &CreateLinkHereTitle=Create Link Title:;string;Create Link &EnableDelete= Delete Button:;list;no,yes;yes &deleteTitle=Delete Title:;string;Delete &ShowButtonsLabel= Show Buttons Label:;list;no,yes;yes &EnableImage= Show Image:;list;no,yes;no &imageTV=Image TV:;string;[+Thumbnail+] &ThumbnailTitle=Image Title:;string;Image &ImageGalleryTitle=Image Gallery Title:;string;Images &FilesGalleryTitle=File Gallery Title:;string;Files
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 */
/******
<<<<<<< HEAD
Article Manager beta 2.4.8
=======
Article Manager beta 2.4.7
>>>>>>> origin/master

&ListSnippet= List Snippet:;list;Ditto,List,DocLister;Ditto &ArticleModuleTitle=Main Page Module Title:;string;Article Manager &ArticleModuleIcon=AwesomeFont icon:;string;fa-pencil &tablefields= Tv Fields:;string;[+pagetitle+],[+longtitle+],[+description+],[+date+],[+documentTags+] &tableheading=TV  heading:;string;Page Title,Long Title,Description,Date,Tags &ParentFolder=Parent folder:;string;0 &ListItems=Max items in List:;string;all &hideFolders= Hide Folders:;list;yes,no;yes &showPublishedOnly= Show Published Only:;list;yes,no;yes &dittolevel= Depht:;string;3 &ListBoxFilter= Enable filter:;list;yes,no;no &dittofilter= Filter:;string; &EnablePopup= Popup Editing:;list;no,yes;yes &editTitle=Editing Title:;string;Edit &EnablePreview= Preview Button:;list;no,yes;yes &previewTitle=Preview Title:;string;View &EnableNewResource= New Resource Button:;list;no,yes;yes &NewResourceTitle=New Resource Title:;string;Add New + &CreateResourceHereTitle=Create Resource  Title:;string;Create Resource &EnableCreateLinks= Create Links Button:;list;no,yes;yes &CreateLinkHereTitle=Create Link Title:;string;Create Link &EnableDelete= Delete Button:;list;no,yes;yes &deleteTitle=Delete Title:;string;Delete &ShowButtonsLabel= Show Buttons Label:;list;no,yes;yes &EnableImage= Show Image:;list;no,yes;no &imageTV=Image TV:;string;[+Thumbnail+] &ThumbnailTitle=Image Title:;string;Image &ImageGalleryTitle=Image Gallery Title:;string;Images &FilesGalleryTitle=File Gallery Title:;string;Files

****
*/
if(!defined('MODX_BASE_PATH')){die('What are you doing? Get out of here!');}
global $_lang, $manager_theme;
$module_id = (!empty($_REQUEST["id"])) ? (int)$_REQUEST["id"] : $yourModuleId;
//config button
if($modx->hasPermission('edit_module')) {
$button_config = '<a title="' . $_lang["settings_config"] . '" href="index.php?a=108&id='.$module_id.'" class="btn btn-sm btn-default" ><i class="fa fa-cog"></i></a>';
}
/*basic params*/
$parentId = $ParentFolder;
$dittototal = $ListItems;
$EditButton = isset($EditButton) ? $EditButton : '';
$DeleteButton = isset($DeleteButton) ? $DeleteButton : '';
$ImagePath = isset($ImagePath) ? $ImagePath : $imageTV;


$parentarr = explode(",","$ParentFolder");
foreach ($parentarr as $parentval){
$parenttitle = $modx->getDocument($parentval);
$parentname = $parenttitle['pagetitle'];
$parentbtns .=  " 
<li><a title='".$CreateResourceHereTitle." " .$parentname."' href='index.php?a=4&pid=" . $parentval . "' title='".$CreateResourceHereTitle."'><i class='fa fa-file-text-o'></i> " .$NewResourceTitle. " " .$parentname." </a></li>";
$parentlinkbtns .=  " 
<li><a title='".$CreateResourceHereTitle." " .$parentname."' href='index.php?a=72&pid=" . $parentval . "' title='".$CreateLinkHereTitle."'><i class='fa fa-link'></i> " .$NewResourceTitle. " " .$parentname." </a></li>";

}

//get Tv vars fields from Module configuration (ie: [+pagetitle+],[+description+],[+date+])
$arr = explode(",","$tablefields");
foreach ($arr as $val){
    $tdfields .=  "
    <td>" . $val . "</td>
    ";
}

//get Tv vars Heading Titles from Module configuration (ie: Page Title,Description,Date)
$tharr = explode(",","$tableheading");
foreach ($tharr as $thval){
    $thheading .=  "
    <th>" . $thval . "</th>
    ";
}

/*Enable/Disable open Popup for Edit Button*/
     if ($EnablePopup == yes) {
          $EditLink .= '<a data-toggle="tooltip" data-placement="bottom" title="'.$editTitle.' [+title+]" class="btn btn-sm btn-success" onclick="window.open(\'index.php?a=27&id=[+id+]\',\'Elements\',\'width=800,height=600,top=\'+((screen.height-600)/2)+\',left=\'+((screen.width-800)/2)+\',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no\')" style="cursor: pointer;" title="'.$editTitle.'"><i class="fa fa-pencil-square-o"></i>';
     }
     if ($EnablePopup == no) {
          $EditLink .= '<a data-toggle="tooltip" data-placement="bottom" title="'.$editTitle.' [+title+]" class="btn btn-sm btn-success" href="index.php?a=27&id=[+id+]" style="cursor: pointer;" title="'.$editTitle.'"><i class="fa fa-pencil"></i>';
     }

//Show/Hide Text inside Buttons
if ($ShowButtonsLabel == yes) {
$previewLabel = $previewTitle;
$editLabel = $editTitle;
$deleteLabel = $deleteTitle;
$NewResourceLabel = $NewResourceTitle;
$CreateResourceHereLabel = $CreateResourceHereTitle;
}
//Module Navbar***********

if ($EnableCreateLinks == yes) {
$CreateLinksNav = '
<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-link"></i> '.$CreateLinkHereTitle.' <span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
'.$parentlinkbtns.'
    </ul>
</li>';
}

if ($EnableNewResource == yes) {
$CreateResourceNav = '<li class="dropdown" data-toggle="dropdown">
	 <li class="dropdown">
          <a href="#" class="dropdown-toggle primary" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-folder-open"></i> '.$CreateResourceHereTitle.' <span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
'.$parentbtns.'
    </ul>
</li>';
}

$Navbar = '
 <nav role="navigation" class="navbar navbar-default navbar-module navbar-right">
<div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
<div id="navbarCollapse" class="collapse navbar-collapse">		
   <ul class="nav navbar-nav ">
   <li><a class="text-muted" href="#" onclick="window.location.reload(true);"><i class="fa fa-refresh"></i></a></li>
'.$CreateResourceNav.'    
'.$CreateLinksNav.'
	<li><a href="media/browser/mcpuk/browse.php?&type=images"><i class="fa fa-picture-o"></i> ' .$ImageGalleryTitle. ' </a></li>
	<li><a href="media/browser/mcpuk/browse.php?&type=files"><i class="fa fa-file-pdf-o"></i> ' .$FilesGalleryTitle. '</a><li>
	'.$button_config.'
	 </ul>
	 </div>
	 </nav>
';

//Show/Hide preview and delete Buttons
if ($EnablePreview == yes) {
$PreviewHeading = '
          <th class="sorting_asc_disabled">'.$previewTitle.'</th>
          ';
$PreviewButton = '
          <td class="bg-info" width="5%"><a data-toggle="tooltip" data-placement="bottom" title="'.$previewTitle.' [+title+]" class="btn btn-sm btn-info" href="../index.php?id=[+id+]" target="_blank" title="'.$previewTitle.'"><i class="fa fa-eye"></i> '.$previewLabel.'</a></td>
          ';
}
if ($EnableDelete == yes) {
$DeleteHeading = '
          <th class="sorting_asc_disabled"> '.$deleteTitle.'</th>
          ';
$DeleteButton = '
          <td class="bg-danger" width="5%"><a data-toggle="tooltip" data-placement="bottom" title="'.$deleteTitle.' [+title+]" class="btn btn-sm btn-danger" href="index.php?a=6&id=[+id+]" title="'.$deleteTitle.'"><i class="fa fa-trash-o"></i> '.$deleteLabel.'</a></td>
          ';
}


//doclister thumbs tv for tvlist param
$findtvimagelist = array('[+','+]');
$replacetvimagelist = array('','');
$DocListerTvImageInList = str_replace($findtvimagelist,$replacetvimagelist,$imageTV);

//DocListerTvFields
$find = array('[+','+]');
$replace = array('','');
$DocListerTvs = str_replace($find,$replace,$tablefields);
$DocListerTvFields = ''.$DocListerTvImageInList.','.$DocListerTvs.'';



//Show/Hide Images

$ImagePath = $imageTV;

if ($EnableImage == yes) {
     $tdThumbnail = '
         <td><img class="img-responsive img-thumbnail" src="../'.$ImagePath.'" height="80" width="140" alt="[+title+]"></td>
          ';
$ThumbnailHeading = '
          <th class="sorting_asc_disabled">'.$ThumbnailTitle.'</th>
          ';
}

// Ditto Tpl - Row with template variable fields inside//////////////////////////////////////////////////////////////////////////////
  $rowTpl = '@CODE:
        <tr>
  <td class="bg-warning" width="5%">[+id+]</td>
  '.$tdThumbnail.'
  '.$tdfields.'
  '.$PreviewButton.'
  <td class="bg-success" width="5%">'.$EditLink.'  '.$editLabel.'</a></td>
  '.$DeleteButton.'</tr>
            ';

// Ditto Snippet parameters
$params['debug'] = '0';
$params['parents'] = $parentId;
$params['depth'] = $dittolevel;
$params['sortBy'] = 'createdon';
$params['sortDir'] = 'DESC';
$params['tpl'] = $rowTpl;
$params['total'] = $dittototal;
if ($ListBoxFilter == yes) {
$params['filter'] = $dittofilter;
}
if ($hideFolders == yes) {
$params['hideFolders'] = '1';
}
if ($hideFolders == no) {
$params['hideFolders'] = '0';
}
//DocLister parameters
if ($ListSnippet == DocLister) {
$params['tvPrefix'] = '';
}

if ($ListSnippet == DocLister) {
$params['tvList'] = $DocListerTvFields;

if ($showPublishedOnly == yes) {
$params['showNoPublish'] = '0';
}
if ($showPublishedOnly == no) {
$params['showNoPublish'] = '1';
}
}

// run Ditto/List/DocLister Snippet
$Articlelist = $modx->runSnippet(''.$ListSnippet.'', $params);


//Module Layout
$Module = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../assets/modules/ArticleManager/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/table/jquery.dataTables.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/TableTools/css/dataTables.tableTools.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/table/dataTables.bootstrap.min.css" rel="stylesheet">
<script src="../assets/modules/ArticleManager/js/jquery.min.js"></script>
<script src="../assets/modules/ArticleManager/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/modules/ArticleManager/js/table/jquery.dataTables.min.js"></script>
<script src="../assets/modules/ArticleManager/js/TableTools/js/dataTables.tableTools.js"></script>

<script>
$(document).ready(function(){
    $(".sortable").DataTable({
    dom:
"<\'row\'<\'col-sm-12\'T>>" +
"<\'row\'<\'col-sm-6\'fl><\'col-sm-6\'pr>>" +
"<\'row\'<\'col-sm-12\'tr>>" +
"<\'row\'<\'col-sm-5\'i><\'col-sm-7\'p>>",
        tableTools: {
                        "sSwfPath": "../assets/modules/ArticleManager/js/TableTools/swf/copy_csv_xls_pdf.swf",
            "aButtons": [
  
                {
                    "sExtends": "csv",
                         "sTitle": "'.$ArticleModuleTitle.'-csv-export",
                    "sButtonText": "CSV"
                },
      
                 {
                    "sExtends": "pdf",
                         "sTitle": "'.$ArticleModuleTitle.'-pdf-export",
                    "sPdfOrientation": "portrait"
                }
            ]
        }
    } );
} );
</script>
</head>
<body>
<div class="container-fluid modulebody">
  <div class="tabbable">
    <div class="main-wrapper">
      <div class="container-fluid">
	   '.$Navbar.'
        <h3 class="moduletitle"><i class="fa '.$ArticleModuleIcon.'"></i> '.$ArticleModuleTitle.' </h3>
      </div>
      <hr>
    <div class="widget-stage overflowscroll">
      <table class="sortable table table-hover table-bordered table-condensed table-striped table-responsive">
        <thead>
             <th data-defaultsort="desc">Id</th>
         
          '.$ThumbnailHeading.'
          '.$thheading.'
          '.$PreviewHeading.'
          <th class="sorting_asc_disabled">'.$editTitle.'</th>
          '.$DeleteHeading.'
            </thead>
        <tbody>
        '.$Articlelist.'
          </tbody>
       
      </table>
      <br style="clear:both;height:1px;margin-top: -1px;line-height:1px;font-size:1px;" />
    </div>
  </div>
</div>
</div>

<script>
$(function () {
  $(\'[data-toggle="tooltip"]\').tooltip()
})
</script>
</body>
</html>
';           
     //end Module Layout

//the Final Output
$output = $Module;
echo $output;

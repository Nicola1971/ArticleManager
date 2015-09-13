/**
 * Article Manager
 *
 * Article Manager Beta 2.1.1 - Manage Blog Posts and more
 *
 * @category	module
 * @version     Beta 2.1.1
 * @author      Author: Nicola Lambathakis http://www.tattoocms.it/
 * @internal	@modx_category Manager
 * @internal    @properties &ListSnippet= List Snippet:;list;Ditto,List,DocLister;Ditto &ArticleModuleTitle=Main Page Module Title:;string;Article Manager &ArticleModuleIcon=AwesomeFont icon:;string;fa-pencil &tablefields= Tv Fields:;string;[+pagetitle+],[+longtitle+],[+description+],[+date+] &tableheading=TV  heading:;string;Page Title,Long Title,Description,Date &ParentFolder=Parent folder:;string;0 &ListItems=Max items in List:;string;all &hideFolders= Hide Folders:;list;yes,no;yes &dittolevel= Depht:;string;3 &ListBoxFilter= Enable filter:;list;yes,no;no &dittofilter= Filter:;string; &EnablePopup= Popup Editing:;list;no,yes;yes &editTitle=Editing Title:;string;Edit &EnablePreview= Preview Button:;list;no,yes;yes &previewTitle=Preview Title:;string;View &EnableDelete= Delete Button:;list;no,yes;yes &deleteTitle=Delete Title:;string;Delete &ShowButtonsLabel= Show Buttons Label:;list;no,yes;yes &EnableImage= Show Image:;list;no,yes;no &imageTV=Image TV:;string;[+Thumbnail+] &ThumbnailTitle=Image Title:;string;Image 
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 */
/******
Article Manager beta 2.1.1

&ListSnippet= List Snippet:;list;Ditto,List,DocLister;Ditto &ArticleModuleTitle=Main Page Module Title:;string;Article Manager &ArticleModuleIcon=AwesomeFont icon:;string;fa-pencil &tablefields= Tv Fields:;string;[+pagetitle+],[+longtitle+],[+description+],[+date+] &tableheading=TV  heading:;string;Page Title,Long Title,Description,Date &ParentFolder=Parent folder:;string;0 &ListItems=Max items in List:;string;all &hideFolders= Hide Folders:;list;yes,no;yes &dittolevel= Depht:;string;3 &ListBoxFilter= Enable filter:;list;yes,no;no &dittofilter= Filter:;string; &EnablePopup= Popup Editing:;list;no,yes;yes &editTitle=Editing Title:;string;Edit &EnablePreview= Preview Button:;list;no,yes;yes &previewTitle=Preview Title:;string;View &EnableDelete= Delete Button:;list;no,yes;yes &deleteTitle=Delete Title:;string;Delete &ShowButtonsLabel= Show Buttons Label:;list;no,yes;yes &EnableImage= Show Image:;list;no,yes;no &imageTV=Image TV:;string;[+Thumbnail+] &ThumbnailTitle=Image Title:;string;Image 


****
*/
if(!defined('MODX_BASE_PATH')){die('What are you doing? Get out of here!');}
global $manager_theme;

/*basic params*/
$parentId = $ParentFolder;
$dittototal = $ListItems;
$EditButton = isset($EditButton) ? $EditButton : '';
$DeleteButton = isset($DeleteButton) ? $DeleteButton : '';

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
}
//Show/Hide preview and delete Buttons
if ($EnablePreview == yes) {
$PreviewHeading = '
		<th class="sorting_asc_disabled"> '.$previewTitle.'</th>
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
//Show/Hide thumbnails
if ($EnableImage == yes) {
	$tdThumbnail = '
		<td><img class="img-responsive img-thumbnail" src="../'.$imageTV.'" height="80" width="140" alt="[+title+]"></td>
		';
$ThumbnailHeading = '
		<th class="sorting_asc_disabled">'.$ThumbnailTitle.'</th>
		';
}
// Ditto Tpl - Row with template variable fields inside
  $rowTpl = '@CODE:
        <tr>
  <td class="bg-warning" width="5%">[+id+]</td>
  '.$tdThumbnail.'
  '.$tdfields.'
  '.$PreviewButton.'
  <td class="bg-success" width="5%">'.$EditLink.' '.$editLabel.'</a></td>
  '.$DeleteButton.'</tr>
		  ';

// Ditto Snippet parameters
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
// run Ditto Snippet
$Articlelist = $modx->runSnippet(''.$ListSnippet.'', $params);


//Module Layout
$Module = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<link href="../assets/modules/ArticleManager/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/table/jquery.dataTables.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/table/dataTables.bootstrap.min.css" rel="stylesheet">
<script src="../assets/modules/ArticleManager/js/jquery.min.js"></script>
<script src="../assets/modules/ArticleManager/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/modules/ArticleManager/js/table/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function(){
    $(".sortable").dataTable();
});
</script>
</head>
<body>
<style>
	body {background: #eeeeee;}
	.sortable {background: #ffffff; margin-top:15px;}
	.main-wrapper {margin-top:15px; background: #ffffff; padding:15px; border:1px solid #dedede; border-radius:8px;}
	input {border-radius: 3px; 
	-webkit-transition: all 0.30s ease-in-out;
  -moz-transition: all 0.30s ease-in-out;
  -ms-transition: all 0.30s ease-in-out;
  -o-transition: all 0.30s ease-in-out;
  outline: none;
  padding: 3px 0px 3px 3px;
  margin: 5px 1px 3px 0px;
  border: 1px solid #DDDDDD;
  }
	input:focus   {box-shadow: 0 0 5px rgba(81, 203, 238, 1);
  padding: 3px 0px 3px 3px;
  margin: 5px 1px 3px 0px;
  border: 1px solid rgba(81, 203, 238, 1);}
  select{
   width: 150px;
   padding: 5px;
   font-size: 16px;
   line-height: 1;
   border:1px solid #dedede;
   border-radius: 2px;
   height: 34px;   
   background: #ffffff;
background: linear-gradient(to bottom,  #ffffff 0%,#f3f3f3 50%,#ededed 51%,#ffffff 100%);
}
thead {background: #ffffff;
background: linear-gradient(to bottom,  #ffffff 0%,#f3f3f3 50%,#ededed 51%,#ffffff 100%);}

	</style>
<div class="container-fluid">
  <div class="tabbable">
    <div class="main-wrapper">
      <div>
        <h3 class="text-success"><i class="fa '.$ArticleModuleIcon.'"></i> '.$ArticleModuleTitle.'</h3>
      </div>
      <hr>
    <div class="widget-stage overflowscroll">
      <table class="sortable table table-hover table-bordered table-condensed table-striped table-responsive">
        <thead>
        
          <th data-defaultsort="desc">Id</th>
          '.$ThumbnailHeading.'
          '.$thheading.'
          '.$PreviewHeading.'
          <th class="sorting_asc_disabled"> '.$editTitle.'</th>
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

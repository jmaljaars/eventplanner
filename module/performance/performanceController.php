<?php
class performanceController extends Controller{
public function __construct(){
    parent::__construct();

    $this->authorize();
    $this->loadMenu();
    $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
    $this->addScript('//code.jquery.com/ui/1.11.2/jquery-ui.js');
    $this->addScript('./themes/sander/bootstrap-3.3.2-dist/js/bootstrap.min.js');
    $this->addStyle('//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css');
}

public function overview(){
	$this->language->load('performance', $this->user['language']);
	$this->welcome = sprintf($this->language->get('welcome'), 'Bart', 'Hanssen');
	$this->all_events = $this->language->get('all_events');

    if (isset($_GET['msg']))
        // Set Header message according to value of $GET['msg']
        $this->setHeaderMSG($this->model->getMessageTextByKey($_GET['msg']));
    else 
        // Set Header Message to a standard text   
        $this->setHeaderMSG('Overzicht performances');
    
    $this->loadModel('performance');
    $this->performance = $this->model->getPerformances();

    $this->loadModel('event');
    $this->events = $this->model->getEvents();

    $this->loadModel('artist');
    $this->artists = $this->model->getArtists();

	//$ws = new Ws();
	
	//echo '<pre>';var_dump($ws->checkVAT('NL', '809808572B01'));echo '</pre>';
	//echo '<pre>';var_dump($ws->checkVAT('BE', '0881377533'));echo '</pre>';

	//echo '<pre>';var_dump($ws->getWeather('10025'));echo '</pre>';

    $this->render('performance_overview.tpl');
}

public function add(){
    $this->setHeaderMSG('Performance toevoegen');
    $this->loadModel('event');
    $this->events = $this->model->getEvents();
    $this->loadModel('artist');
    $this->artists = $this->model->getArtists();
    $this->loadModel('location');
    $this->locations = $this->model->getLocations();
    
    if($_POST)
    {
        $this->loadModel('performance');
        $this->model->addPerformance($_POST);	
        $this->redirect('performance/overview', $_GET['token'],'',$_GET['lang']);
    }
    else
    {		
        // $this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
        $this->render('performance_detail.tpl');		
    }
}

public function edit(){
    $this->setHeaderMSG('Performance Aanpassen');
    $this->loadModel('event');
    $this->events = $this->model->getEvents();
    $this->loadModel('artist');
    $this->artists = $this->model->getArtists();
    $this->loadModel('location');
    $this->locations = $this->model->getLocations();
    $this->loadModel('performance');

    if($_POST)
    {
        if($this->validate($_POST))
            $this->model->editPerformance($_POST);					
        $this->redirect('performance/overview', $_GET['token'],'msg_PERFADDED',$_GET['lang']);
    }

    if(isset($_GET['id']))
    {
            $id = $_GET['id'];
            $this->performance = $this->model->getPerformance($id);
            $this->render('performance_detail.tpl');		
    }
}

public function delete(){
    if(isset($_GET['id']))
        {
            $id = $_GET['id'];
            $this->loadModel('performance');
            $this->model->deletePerformance($id);
    }
    $this->redirect('performance/overview', $_GET['token'],'',$_GET['lang']);
}
	
private function validate($data){
        foreach($data as $k => $v){
                if(substr($k, 0, 3) == 'req'){
                        if($v == ''){
                                return false;
                        }
                }

                if(substr($k, 0, 6) == 'reqnum'){
                        if(!is_numeric($v)){
                                return false;
                        }
                }
        }
        return true;
}

}
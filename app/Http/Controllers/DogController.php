<?php
 
namespace App\Http\Controllers;
 
use App\Dog;
use App\Http\Controllers\Controller;
 
class DogController extends Controller
{
    /**
     * Get the dog with by the given id.
     *
     * @param  int  $id
     */
    public function getById($id) 
    {
        return Dog::findOrFail($id);
    }

    /**
     * Get all the dogs
     */
     public function getAll(){
         return Dog::all();
     }
}
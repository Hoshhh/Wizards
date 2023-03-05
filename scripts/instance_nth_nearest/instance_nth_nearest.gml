function instance_nth_nearest(xx,yy,obj,num){
	var pointx,pointy,object,n,list,nearest;
    pointx = xx;
    pointy = yy;
    object = obj;
    n = num;
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}
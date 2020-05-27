import 'dart:io';

void dijkstra(int n, int v, List<List<int>> matrix, List<int> dist)
{
  int i,k,count,min;
  List<int> visited=List(n);
  for(i=0;i<n;i++)
  {
    visited[i]=0;
    dist[i]=matrix[v][i];
  }
  visited[v]=1;
  dist[v]=0;
  count=2;
  while(count<n)
  {
    min=999;
    for(i=0;i<n;i++)
    {
      if(dist[i]<min && visited[i]==0)
      {
        min=dist[i];
        k=i;
      }
    }
    visited[k]=1;
    count++;
    for(i=0;i<n;i++)
    {
      if(visited[i]==0)
      {
        if(dist[i]>dist[k]+matrix[k][i])
        {
          dist[i]=dist[k]+matrix[k][i];
        }
      }
    }
  }
}

void main1() {
  int i;
  print("enter the size of matrix");
  var n=int.parse(stdin.readLineSync());
  List<String> cityNames=['mumbai','chennai','delhi','bangalore','kolkata','hydrabad'];
  List<int> dist=List(n);

    
    List<List<int>> matrix=[[0,10,999,999,999,999],[10,0,20,999,40,60],[999,999,0,999,30,999],[999,50,999,0,130,999]
    ,[999,999,30,130,0,999],[100,999,999,120,999,0]];

  var v;
  print("enter the ur origin city");
  var origin=stdin.readLineSync();
  for(i=0;i<6;i++)
   {
     if (cityNames[i]==origin)
      {
        v=i;
        break;
      }
   }
  dijkstra(n, v, matrix, dist);
  v=v+1;
  print('enter the destination city');
  var destination=stdin.readLineSync();
  var q;
  for(i=0;i<6;i++)
   {
     if (cityNames[i]==destination)
      {
        q=i;
        break;
      }
   }
   print("the shortest distance between the given stations is \n");
   print(dist[q]);
}
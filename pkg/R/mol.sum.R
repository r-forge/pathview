mol.sum <-
function(mol.data, id.map, gene.annotpkg="org.Hs.eg.db", sum.method=c("sum","mean", "median", "max", "max.abs", "random")[1]){
  if(is.character(mol.data)){
    gd.names=mol.data
    mol.data=rep(1, length(mol.data))
    names(mol.data)=gd.names
    ng=length(mol.data)
  } else if(!is.null(mol.data)){
    if(length(dim(mol.data))==2){
    gd.names=rownames(mol.data)
    ng=nrow(mol.data)
    } else if(is.numeric(mol.data) & is.null(dim(mol.data))){
    gd.names=names(mol.data)
    ng=length(mol.data)
    } else stop("wrong mol.data format!")
  } else stop("NULL mol.data!")

  if(is.character(id.map) & length(id.map)==1){
    id.map=id2eg(gd.names, category=id.map, pkg.name=gene.annotpkg)
  }
  
  sel.idx=id.map[,2]>"" & !is.na(id.map[,2])
  id.map=id.map[sel.idx,]
  eff.idx=gd.names %in% id.map[,1]
  mapped.ids=id.map[match(gd.names[eff.idx], id.map[,1]),2]
  sum.method=eval(as.name(sum.method))
  mapped.data=apply(cbind(cbind(mol.data)[eff.idx,]),2,function(x){
  sum.res=tapply(x, mapped.ids, sum.method, na.rm=T)
  return(sum.res)
})
  return(mapped.data)
}

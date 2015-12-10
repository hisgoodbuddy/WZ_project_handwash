function [cont_selected_idx, amus_selected_idx]=select_dat(contentment,amusement,awe,excitement,valence,arousal)
    all=cat(1, contentment,amusement,awe,excitement);
    contentment_dom.idx=[];
    contentment_dom.amusement_partner_idx=[];
    contentment_dom.partner_distance_VA_domain=[];

    all=all';
    idx_a=1;
    idx_c=1;
    for i=1:51
        if (max(all(i,:))==all(i,1))&&(abs(all(i,1)-all(i,2))>10)        
            contentment_dom(idx_c).idx=i;
            idx_c=idx_c+1;
        elseif (max(all(i,:))==all(i,2))&&(abs(all(i,1)-all(i,2))>10)
            amusement_dom(idx_a)=i;
            idx_a=idx_a+1;
        end
    end
    clear i;
    i=sqrt(-1);
    cmp_amusement_dom=valence(amusement_dom)+i*arousal(amusement_dom);
    figure; 
    for k=1:length(contentment_dom)
        this_point=valence(contentment_dom(k).idx)+i*arousal(contentment_dom(k).idx);
        plot(this_point,'ro'); xlim([0 200]); ylim([0 200]); hold on;
        distance=abs(cmp_amusement_dom-this_point);
        this_point_partner_idx=find(distance==min(distance));
        contentment_dom(k).amusement_partner_idx=amusement_dom(this_point_partner_idx(1));
        contentment_dom(k).partner_distance_VA_domain=min(distance);
        plot((valence(contentment_dom(k).amusement_partner_idx)+i*arousal(contentment_dom(k).amusement_partner_idx)),'bo'); xlim([0 200]); ylim([0 180]); hold on;

    end
    legend('Contentment dominant','Amusement dominant');
    xlabel('valence'); ylabel('arousal');
    exportfilename = ['valence_VS_arousal','.tiff'];
    print ('-dtiff','-r300', exportfilename);
    close 

    contentment_dom_m=cell2mat(struct2cell(contentment_dom));
    all_distance=squeeze(contentment_dom_m(3,:,:));
    partner_id=squeeze(contentment_dom_m(2,:,:));
    sorted=sort(all_distance,'ascend');

    tt=1;
    selected_idx=[];
    while((length(selected_idx)<5)&&(tt<=length(sorted)))
        this_idx=find(all_distance==sorted(tt));
        if(isempty(find(partner_id(selected_idx)==partner_id(this_idx)))) %no use the same partner
            selected_idx=cat(1, selected_idx, this_idx);
        end
        tt=tt+1;
    end

    contentment_dom_selected=contentment_dom(selected_idx);
    contentment_dom_selected_m=cell2mat(struct2cell(contentment_dom_selected));
    figure;
    plot(valence(squeeze(contentment_dom_selected_m(1,:,:))), arousal(squeeze(contentment_dom_selected_m(1,:,:))),'ro');xlim([0 200]); ylim([0 200])
    hold on
    plot(valence(squeeze(contentment_dom_selected_m(2,:,:))), arousal(squeeze(contentment_dom_selected_m(2,:,:))),'bo'); xlim([0 200]); ylim([0 200])
    cont_selected_idx=squeeze(contentment_dom_selected_m(1,:,:));
    amus_selected_idx=squeeze(contentment_dom_selected_m(2,:,:));
    legend('Contentment dominant','Amusement dominant');
    xlabel('valence'); ylabel('arousal');
    title('selected data');
    exportfilename = ['selected_data','.tiff'];
    print ('-dtiff','-r300', exportfilename);
    close 
end